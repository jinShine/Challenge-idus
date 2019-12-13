//
//  NetworkServiceStub.swift
//  idusTests
//
//  Created by Seungjin on 12/12/2019.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Foundation
@testable import idus

enum StubType: String {

  case product_list,
  product_detail
}

protocol NetworkServiceStubProtocol {

  func get<T: Decodable>(decoder: T.Type, resource: String, ext: String) -> NetworkDataResponse
}


class NetworkServiceStub: NetworkServiceStubProtocol, NetworkServiceType {

  let stub: StubType

  init(stub: StubType) {
    self.stub = stub
  }

  func get<T: Decodable>(decoder: T.Type, resource: String, ext: String) -> NetworkDataResponse {
    let bundle = Bundle(for: type(of: self))
    guard let file = bundle.url(forResource: resource, withExtension: ext),
      let data = try? Data(contentsOf: file) else {
        return NetworkDataResponse(json: nil, result: .failure, error: nil)
    }

    do {
      let model = try data.decode(decoder)
      return NetworkDataResponse(json: model, result: .success, error: nil)
    } catch {
      return NetworkError.transform(jsonData: data)
    }
  }

  func buildRequest<T>(to router: IdusRouter, decoder: T.Type, completion: @escaping (NetworkDataResponse) -> Void) where T : Decodable {
    completion(get(decoder: decoder, resource: stub.rawValue, ext: "json"))
  }

}
