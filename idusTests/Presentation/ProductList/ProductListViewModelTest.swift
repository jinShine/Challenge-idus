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
  
  
  var networkDataResponse: NetworkDataResponse!
  var viewModel: ProductListViewModel!
  
  override func setUp() {
    super.setUp()
    
    let networkServiceStub = NetworkServiceStub(stub: .product_list)
    let repositoty = IdusRepository(networkService: networkServiceStub)
    viewModel = ProductListViewModel(idusUseCase: IdusUseCaseImpl(idusRepository: repositoty))
    
    let page = 1
    expectation { expectation in
      self.viewModel.updateProductList(page: page) { response in
        self.networkDataResponse = response
        expectation.fulfill()
      }
    }
  }
  
  override func tearDown() { }
  
  func test_NumberOfSections() {
    XCTAssertEqual(viewModel.numberOfSections(), 1)
  }
  
  func test_UpdateProductListResponse_IsNotEmpty() {
    guard let model = networkDataResponse.json as? ProductModel else {
      XCTFail()
      return
    }
    
    XCTAssertEqual(model.statusCode, 200)
    XCTAssertFalse(model.body.isEmpty)
  }
  
  func test_updateProductList_ResponseSuccess() {
    XCTAssertEqual(networkDataResponse.result, .success)
  }
  
  func test_whenLoadMore_responseResultSuccess() {
    let indexPath = IndexPath(item: 49, section: 0)
    
    expectation { expectation in
      self.viewModel.loadMore(at: indexPath) { response in
        XCTAssertEqual(response.result, .success)
        expectation.fulfill()
      }
    }
  }
  
}
