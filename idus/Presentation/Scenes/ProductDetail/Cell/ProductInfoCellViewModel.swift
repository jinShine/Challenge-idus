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

  init(seller: String, title: String, discountRate: String? = nil, discountCost: String? = nil, cost: String) {

    self.seller = seller
    self.title = title
    if let discountRate = discountRate {
      self.discountRate = "-" + discountRate
    }
    
    if let discountCost = discountCost {
      self.discountCost = discountCost
    }
    
    self.cost = cost
  }

}
