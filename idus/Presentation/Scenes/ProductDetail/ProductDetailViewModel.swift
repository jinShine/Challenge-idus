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

  private func transformThumbnail(by content: DetailContent) -> [String] {
    return content.thumbnailList
        .components(separatedBy: "#")
        .map { $0.replacingOccurrences(of: "_320", with: "_720") }
  }

}

