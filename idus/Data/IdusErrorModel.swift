//
//  ErrorModel.swift
//  idus
//
//  Created by seungjin on 2019/12/03.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Foundation

/*
 {
   "statusCode": 400,
   "body": "ParameterIsNotInteger - 요청 변수가 Integer 타입이 아닙니다!"
 }
 */

struct IdusErrorModel: Decodable {
  var statusCode: Int
  var body: String
}
