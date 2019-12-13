//
//  Mocker.swift
//  idusTests
//
//  Created by seungjin on 2019/12/14.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Foundation
@testable import idus

class Morker: NetworkServiceStub {
  
  static func product(stub: StubType, completion: @escaping ([ProductContent]) -> Void) {
    let morker = Morker(stub: .product_list)
    morker.buildRequest(to: .productList(page: 1), decoder: ProductModel.self) { response in
      guard let model = response.json as? ProductModel else {
        return
      }

      completion(model.body)
    }
  }
  
}
