//
//  ProductDetailViewModel.swift
//  idusTests
//
//  Created by seungjin on 2019/12/14.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Foundation
import XCTest
@testable import idus

class ProductDetailViewModelTest: XCTestCase {
  
  var networkDataResponse: NetworkDataResponse!
  var viewModel: ProductDetailViewModel!
  
  override func setUp() {
    super.setUp()
    
    let networkServiceStub = NetworkServiceStub(stub: .product_detail)
    let repositoory = IdusRepository(networkService: networkServiceStub)
    
    let id = 1
    viewModel = ProductDetailViewModel(
      idusUseCase: IdusUseCaseImpl(idusRepository: repositoory
    ), id: id)
    
    expectation { expectation in
      self.viewModel.fetchProductDetail { response in
        self.networkDataResponse = response
        expectation.fulfill()
      }
    }
    
  }
  
  func test_NumberOfSection() {
    XCTAssertEqual(viewModel.numberOfSections(), 1)
  }
  
  func test_NumberOfRowsInSection() {
    XCTAssertEqual(ProductDetailViewModel.CellType.totalCount.rawValue, 4)
  }
  
  func test_FetchProductDetail_ResposneSuccees() {
    XCTAssertEqual(networkDataResponse.result, .success)
  }
  
  func test_FetchProductDetail_IsNotEmpty() {
    guard let model = networkDataResponse.json as? ProductDetailModel else {
      XCTFail()
      return
    }
    
    XCTAssertEqual(model.statusCode, 200)
    XCTAssertFalse(model.body.isEmpty)
  }
  
  func test_ProductInfo() {
    let info = viewModel.productInfo()
    
    guard let model = networkDataResponse.json as? ProductDetailModel,
      let content = model.body.first else {
        XCTFail()
        return
    }
    
    XCTAssertEqual(info.seller, content.seller)
    XCTAssertEqual(info.title, content.title)
    XCTAssertEqual(info.discountRate, content.discountRate)
    XCTAssertEqual(info.discountCost, content.discountCost)
    XCTAssertEqual(info.cost, info.cost)
  }
  
  func test_descriptionInfo() {
    let info = viewModel.descriptionInfo()
    
    guard let model = networkDataResponse.json as? ProductDetailModel,
      let content = model.body.first else {
        XCTFail()
        return
    }
    
    XCTAssertEqual(info.description, content.description)
  }
}
