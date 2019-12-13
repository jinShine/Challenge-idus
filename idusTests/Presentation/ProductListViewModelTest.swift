//
//  ProductListViewModelTest.swift
//  idusTests
//
//  Created by Seungjin on 13/12/2019.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Foundation
import XCTest
@testable import idus

class ProductListViewModelTest: XCTestCase {

  let page = 1
  var viewModel: ProductListViewModel!
  var networkDataResponse: NetworkDataResponse!

  override func setUp() {
    super.setUp()

    let networkServiceStub = NetworkServiceStub(stub: .product_list)
    let repositoty = IdusRepository(networkService: networkServiceStub)
    viewModel = ProductListViewModel(idusUseCase: IdusUseCaseImpl(idusRepository: repositoty))

    expectation { expectation in
      self.viewModel.updateProductList(page: self.page) { response in
        self.networkDataResponse = response
        expectation.fulfill()
      }
    }

  }

  override func tearDown() {

  }

  func test_NumberOfSections() {
    XCTAssertEqual(viewModel.numberOfSections(), 1)
  }

  func test_UpdateProductListData_Count() {

  }

  func test_updateProductList_Success() {
    XCTAssertEqual(networkDataResponse.result, .success)
//    expectation { expectation in
//      self.viewModel.updateProductList(page: page) { response in
//        XCTAssertEqual(response.result, .success)
//
//        guard let model = response.json as? ProductModel,
//          let body = model.body.first else {
//          XCTFail()
//          return
//        }
//
//        /*
//         "id": 1,
//         "seller": "골든팜",
//         "title": "겨울에 아삭한여름복숭아먹기"
//         */
//
//        XCTAssertEqual(model.statusCode, 200)
//        XCTAssertEqual(body.seller, "골든팜")
//
//
//      }
//    }
  }

//  func test_updateProductListJson

}

extension XCTestCase {

  func expectation(_ handler: @escaping (XCTestExpectation) -> Void) {
    let expectation = XCTestExpectation(description: "com.foodora.courier.async.expectation")
    handler(expectation)
    wait(for: [expectation], timeout: 10)
  }

}
