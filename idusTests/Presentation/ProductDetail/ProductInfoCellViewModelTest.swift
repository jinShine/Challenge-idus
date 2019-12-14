//
//  ProductInfoCellViewModelTest.swift
//  idusTests
//
//  Created by seungjin on 2019/12/15.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Foundation
import XCTest
@testable import idus

class ProductInfoCellViewModelTest: XCTestCase {
  
  var detailContent: DetailContent?
  
  override func setUp() {
    expectation { expectation in
      Morker.productDetail(stub: .product_detail) { product in
        self.detailContent = product
        expectation.fulfill()
      }
    }
  }
  
  override func tearDown() { }
  
  func test_ProductInfoCellViewModel() {
    let content = detailContent!
    let vm = ProductInfoCellViewModel(seller: content.seller, title: content.title, discountRate: content.discountRate, discountCost: content.discountCost, cost: content.cost)
    
    XCTAssertEqual(content.seller, vm.seller)
    XCTAssertEqual(content.title, vm.title)
    XCTAssertEqual(content.discountRate, vm.discountRate)
    XCTAssertEqual(content.discountCost, vm.discountCost)
    XCTAssertEqual(content.cost, vm.cost)
  }
  
}
