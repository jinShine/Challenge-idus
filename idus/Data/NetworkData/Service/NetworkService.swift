//
//  NetworkService.swift
//  idus
//
//  Created by seungjin on 2019/12/03.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Foundation

import Moya
import Alamofire

struct NetworkService {

  static private let sharedManager: Alamofire.SessionManager = {
    let configuration = URLSessionConfiguration.default
    configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
    configuration.timeoutIntervalForRequest = 30
    configuration.timeoutIntervalForResource = 30
    configuration.requestCachePolicy = NSURLRequest.CachePolicy.useProtocolCachePolicy
    return Alamofire.SessionManager(configuration: configuration)
  }()
  
  private let provider: MoyaProvider<IdusRouter> = {
    let provider = MoyaProvider<IdusRouter>(endpointClosure: MoyaProvider.defaultEndpointMapping,
                                        requestClosure: MoyaProvider<IdusRouter>.defaultRequestMapping,
                                        stubClosure: MoyaProvider.neverStub,
                                        callbackQueue: nil,
                                        manager: sharedManager,
                                        plugins: [],
                                        trackInflights: false)
    return provider
  }()
  
  
  func buildRequest(to router: IdusRouter, completion: @escaping (NetworkDataResponse) -> Void)  {
    provider.request(router) { response in
      switch response {
      case .success(let result):
        completion(NetworkDataResponse(jsonData: result.data, result: .success))
      case .failure:
        completion(NetworkDataResponse(jsonData: response.value?.data, result: .failure))
      }
    }
  }
  
}
