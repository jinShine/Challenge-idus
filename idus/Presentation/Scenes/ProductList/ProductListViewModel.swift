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


  //MARK:- Init
  
  init(idusUseCase: IdusUseCase) {
    self.idusUseCase = idusUseCase
  }


  //MARK:- Methods
  
  func productListUpdate(completion: @escaping (NetworkDataResponse) -> Void) {
    idusUseCase.executeProductList { [weak self] response in
      guard let model = response.model as? ProductModel else { return }
      self?.productList = model.body
      completion(response)
    }
  }

  func numberOfItemsInSection() -> Int {
    return productList.count
  }

  
}
