//
//  Data+Decode.swift
//  idus
//
//  Created by Seungjin on 03/12/2019.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Foundation

extension Data {

  func decode<T>(_ type: T.Type, decoder: JSONDecoder? = nil) throws -> T where T: Decodable {
    let decoder = decoder ?? JSONDecoder()
    return try decoder.decode(type, from: self)
  }
}
