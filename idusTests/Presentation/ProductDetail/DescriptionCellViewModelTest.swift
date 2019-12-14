//
//  DescriptionCellViewModelTest.swift
//  idusTests
//
//  Created by seungjin on 2019/12/15.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Foundation
import XCTest
@testable import idus

class DescriptionCellViewModelTest: XCTestCase {
  
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
  
  func test_DescriptionCellViewModel() {
    let content = detailContent!
    let vm = DescriptionCellViewModel(description: content.description)
    
    XCTAssertEqual(content.description, vm.description)
  }
  
}
