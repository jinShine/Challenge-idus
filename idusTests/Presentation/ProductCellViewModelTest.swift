//
//  ProductCellViewModelTest.swift
//  idusTests
//
//  Created by Seungjin on 13/12/2019.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import XCTest
@testable import idus

class ProductCellViewModelTest: XCTestCase {
  
  private var content: ProductContent?
  
  override func setUp() {
    expectation { expectationn in
      Morker.product(stub: .product_list) { product in
        self.content = product.first
        expectationn.fulfill()
      }
    }
  }
  
  override func tearDown() { }
  
  func test_ProductContent_NotNil() {
    XCTAssertNotNil(content)
  }
  
  func test_ProductCellViewModel() {
    let vm = ProductCellViewModel(content: content!)
    
    XCTAssertEqual(vm.id, content?.id)
    XCTAssertEqual(vm.productImage, content?.thumbnail)
    XCTAssertEqual(vm.title, content?.title)
    XCTAssertEqual(vm.seller, content?.seller)
  }
  
}
