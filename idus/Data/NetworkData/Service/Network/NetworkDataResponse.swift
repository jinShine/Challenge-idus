//
//  NetworkDataResponse.swift
//  idus
//
//  Created by seungjin on 2019/12/03.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Foundation

enum NetworkResult {
    case success,
    failure
}

struct NetworkDataResponse {
  let model: Decodable?
  let result: NetworkResult
  let error: NetworkError?
}
