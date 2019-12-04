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
  var pageCount: Int = 20


  //MARK:- Init
  
  init(idusUseCase: IdusUseCase) {
    self.idusUseCase = idusUseCase
  }


  //MARK:- Methods
  
  func productListUpdate(page: Int, completion: @escaping (NetworkDataResponse) -> Void) {
    idusUseCase.executeProductList(page: page) { [weak self] response in
      guard let model = response.model as? ProductModel else {
        return completion(response)
      }
      model.body.forEach { self?.productList.append($0) }
      completion(response)
    }
  }

  func numberOfItemsInSection() -> Int {
    return productList.count
  }

  func loadMore(at indexPath: IndexPath, completion: @escaping (Bool) -> Void) {
    if indexPath.item == productList.count - 1 {
      pageCount += 1
      productListUpdate(page: pageCount) { [weak self] response in
        guard let product = response.model as? ProductModel else {
          return completion(false)
        }

        product.body.forEach {
          self?.productList.append($0)
        }
        completion(true)
      }
    }
  }
}
