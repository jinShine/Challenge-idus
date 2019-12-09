//
//  ProductCellViewModel.swift
//  idus
//
//  Created by Seungjin on 03/12/2019.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

class ProductCellViewModel {

  //MARK: Properties
  
  var id: Int
  var productImage: String
  var title: String
  var seller: String

  //MARK:- Init

  init(content: ProductContent) {
    self.id = content.id
    self.title = content.title
    self.seller = content.seller
    self.productImage = content.thumbnail
  }

}
