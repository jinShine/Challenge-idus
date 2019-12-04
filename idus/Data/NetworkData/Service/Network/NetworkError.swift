//
//  NetworkError.swift
//  idus
//
//  Created by seungjin on 2019/12/03.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Foundation

struct NetworkError {
  let statusCode: Int
  let message: String

  static func transform(jsonData: Data?) -> NetworkDataResponse {

    do {
      let result = try JSONDecoder().decode(IdusErrorModel.self, from: jsonData ?? Data())
      DLog(result)
      return NetworkDataResponse(model: nil,
                          result: .failure,
                          error: NetworkError(statusCode: result.statusCode, message: result.body))
    } catch {
      DLog("NetworkError Decodable Error")
      return NetworkDataResponse(model: nil, result: .failure, error: nil)
    }

  }
}

