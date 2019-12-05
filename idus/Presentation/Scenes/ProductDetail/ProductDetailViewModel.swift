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

//  enum CellType: Int {
//    case product
//  }


  //MARK:- Properties

  private let idusUseCase: IdusUseCase
  private let id: Int


  //MARK:- Init

  init(idusUseCase: IdusUseCase, id: Int) {
    self.idusUseCase = idusUseCase
    self.id = id
  }


  //MARK:- Methods


}

