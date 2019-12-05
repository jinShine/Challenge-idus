//
//  ProductViewModel.swift
//  idus
//
//  Created by seungjin on 2019/12/02.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

final class ProductListViewModel {

  //MARK:- Cell Type
  
  enum CellType: Int {
    case product
  }


  //MARK:- Properties

  private let idusUseCase: IdusUseCase
  var productList: [Content] = []
  var pageCount: Int = 1


  //MARK:- Init
  
  init(idusUseCase: IdusUseCase) {
    self.idusUseCase = idusUseCase
  }


  //MARK:- Methods

  func updateProductList(page: Int, completion: @escaping (NetworkDataResponse) -> Void) {
    idusUseCase.executeProductList(page: page) { [weak self] response in
      guard let model = response.json as? ProductModel else {
        completion(response)
        return
      }

      model.body.forEach { self?.productList.append($0) }
      completion(response)
    }
  }

  func loadMore(at indexPath: IndexPath, completion: @escaping (NetworkDataResponse) -> Void) {
    if indexPath.item == productList.count - 1 {
      pageCount += 1
      updateProductList(page: pageCount, completion: completion)
    }
  }

  func numberOfItemsInSection() -> Int {
    return productList.count
  }

}
