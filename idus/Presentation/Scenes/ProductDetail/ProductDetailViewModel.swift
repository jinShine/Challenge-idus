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
  var thumbnailList: [String] = []


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

      self.getThumbnailList(by: contents).forEach {
        self.thumbnailList.append($0)
      }

      completion(response)
    }
  }

  private func getThumbnailList(by content: [DetailContent]) -> [String] {
    var list: [String] = []
    guard let content = content.first else {
      return list
    }
    list = transformThumbnail(by: content)

    return list
  }

  private func transformThumbnail(by content: DetailContent) -> [String] {
    var list: [String] = []
    list.append(content.thumbnail)
    content.thumbnailList
      .components(separatedBy: "#")
      .forEach { list.append($0) }

    return list
  }

}

