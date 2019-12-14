//
//  ThumbnailCollectionViewCellViewModelTest.swift
//  idusTests
//
//  Created by seungjin on 2019/12/14.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Foundation
import XCTest
@testable import idus

class ThumbnailCollectionViewCellViewModelTest: XCTestCase {
  
  var thumbnailList: [String]?
  
  override func setUp() {
    expectation { expectation in
      Morker.productDetail(stub: .product_detail) { product in
        self.thumbnailList = product.thumbnailList
          .components(separatedBy: "#")
          .map { $0.replacingOccurrences(of: "_320", with: "_720") }
        expectation.fulfill()
      }
    }
  }
  
  override func tearDown() { }
  
  func test_thumbnailList_Count() {
    let vm = ThumbnailCollectionViewCellViewModel(thumbnailList: thumbnailList!)
    XCTAssertTrue(vm.thumbnailList.count > 0)
  }
  
  func test_NumberofSections() {
    let vm = ThumbnailCollectionViewCellViewModel(thumbnailList: thumbnailList!)
    XCTAssertEqual(vm.numberOfSections(), 1)
  }
  
}
