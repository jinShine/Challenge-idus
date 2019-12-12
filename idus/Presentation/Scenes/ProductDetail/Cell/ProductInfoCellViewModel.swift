//
//  InfomationCellViewModel.swift
//  idus
//
//  Created by seungjin on 2019/12/09.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Foundation

class ProductInfoCellViewModel {

  //MARK: Properties
  
  var seller: String
  var title: String
  var discountRate: String?
  var discountCost: String?
  var cost: String


  //MARK:- Init

  init(seller: String, title: String, discountRate: String? = "", discountCost: String? = "", cost: String) {
    self.seller = seller
    self.title = title
    self.discountRate = discountRate
    self.discountCost = discountCost
    self.cost = cost
  }

}
