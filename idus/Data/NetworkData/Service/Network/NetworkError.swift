//
//  NetworkError.swift
//  idus
//
//  Created by seungjin on 2019/12/03.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Foundation

enum NetworkStatusCode: Int {
  case ok = 200
  case badRequest = 400
  case notFound = 404
  case serverError = 500
}

struct NetworkError {
  let statusCode: NetworkStatusCode
  let body: String
}
