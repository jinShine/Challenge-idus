//
//  ProductDetailViewModel.swift
//  idus
//
//  Created by Seungjin on 05/12/2019.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

final class ProductDetailViewModel {

  //MARK:- Cell Type

  enum CellType: Int {
    case thumbnailList
    case productInfo
    case description
    case notice
    case totalCount
  }


  //MARK:- Properties

  private let idusUseCase: IdusUseCase
  private let id: Int
  var contentList: [DetailContent] = []


  //MARK:- Init

  init(idusUseCase: IdusUseCase, id: Int) {
    self.idusUseCase = idusUseCase
    self.id = id
  }


  //MARK:- Methods

  func fetchProductDetail(completion: @escaping (NetworkDataResponse) -> Void) {
    idusUseCase.executeProductDetail(id: id) { [weak self] response in
      guard let self = self else { return }
      guard let model = response.json as? ProductDetailModel else {
        completion(response)
        return
      }

      let contents = model.body
      contents.forEach { self.contentList.append($0) }

      completion(response)
    }
  }
  
  func thumbnailList() -> [String] {
    guard let content = contentList.first else {
      return []
    }
    
    return transformThumbnail(by: content)
  }

  func productInfo() -> (seller: String, title: String, discountRate: String?, discountCost: String?, cost: String) {
    guard let content = contentList.first else {
      return ("", "", "", "", "")
    }

    return (content.seller, content.title, content.discountRate, content.discountCost, content.cost)
  }

  func descriptionInfo() -> String {
    guard let content = contentList.first else {
      return ""
    }

    return content.description
  }

  private func transformThumbnail(by content: DetailContent) -> [String] {
    return content.thumbnailList
        .components(separatedBy: "#")
        .map { $0.replacingOccurrences(of: "_320", with: "_720") }
  }


  //MARK: - data source

  func numberOfSections() -> Int {
    return 1
  }

  func numberOfRowsInSection() -> Int {
    return CellType.totalCount.rawValue
  }

}

