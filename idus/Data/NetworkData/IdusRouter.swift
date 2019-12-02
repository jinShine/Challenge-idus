//
//  IdusRouter.swift
//  idus
//
//  Created by seungjin on 2019/12/03.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Moya

enum IdusRouter {
  case productsList
  case productsDetail(page: String)
}

extension IdusRouter: TargetType {
  
  var baseURL: URL {
    return URL(string: "https://2jt4kq01ij.execute-api.ap-northeast-2.amazonaws.com/prod/")!
  }
  
  var path: String {
    switch self {
    case .productsList:
      return "/products"
    case .productsDetail:
      return "/products"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .productsList, .productsDetail:
      return .get
    }
  }
  
  var sampleData: Data {
    return "data".data(using: String.Encoding.utf8)!
  }
  
  var task: Task {
    switch self {
    case .productsList:
      return .requestParameters(parameters: [:], encoding: URLEncoding.queryString)
    case .productsDetail(let page):
      return .requestParameters(parameters: ["page" : page], encoding: URLEncoding.queryString)
    }
  }
  
  var headers: [String : String]? {
    return ["Content-Type": "application/json"]
  }
}
