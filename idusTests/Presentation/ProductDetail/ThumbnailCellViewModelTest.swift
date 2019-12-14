//
//  ThumbnailCellViewModelTest.swift
//  idusTests
//
//  Created by seungjin on 2019/12/15.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Foundation
import XCTest
@testable import idus

class ThumbnailCellViewModelTest: XCTestCase {
  
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
  
  func test_ThumbnailCellViewModel() {
    let content = detailContent!
    let vm = ThumbnailCellViewModel(thumbnail: content.thumbnail)
    XCTAssertEqual(content.thumbnail, vm.thumbnail)
  }
  
}
