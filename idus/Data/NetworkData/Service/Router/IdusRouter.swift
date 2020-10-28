//
//  IdusRouter.swift
//  idus
//
//  Created by seungjin on 2019/12/03.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Moya

enum IdusRouter {
  case productList(page: Int)
  case productDetail(id: Int)
}

extension IdusRouter: TargetType {
  
  var baseURL: URL {
    return URL(string: "https://2jt4kq01ij.execute-api.ap-northeast-2.amazonaws.com/prod/")!
  }
  
  var path: String {
    switch self {
    case .productList:
      return "/products"
    case .productDetail(let id):
      return "/products/\(id)"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .productList, .productDetail:
      return .get
    }
  }
  
  var sampleData: Data {
    return "data".data(using: String.Encoding.utf8)!
  }
  
  var task: Task {
    switch self {
    case .productList(let page):
      return .requestParameters(parameters: ["page" : page], encoding: URLEncoding.queryString)
    case .productDetail:
      return .requestPlain
    }
  }
  
  var headers: [String : String]? {
    return [
      "Content-Type" : "application/json",
      "token" : "17781fd0e005ba7dbe802a5a3f3ea4b7"
    ]
  }
}
