//
//  ProductModel.swift
//  idus
//
//  Created by Seungjin on 03/12/2019.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Foundation

/*
 {
 "statusCode": 200,
 "body": [
     {
       "thumbnail_520": "https://image.idus.com/image/files/4e47e2fa54e84fedbe56b610475adf0c_520.jpg",
       "id": 1,
       "seller": "골든팜",
       "title": "겨울에 아삭한여름복숭아먹기"
     }
   ]
 }
 */

struct ProductModel: Decodable {
  var statusCode: Int
  var body: [ProductContent]
}

struct ProductContent: Decodable {
  var id: Int
  var thumbnail: String
  var seller: String
  var title: String

  enum CodingKeys: String, CodingKey {
    case id, seller, title
    case thumbnail = "thumbnail_520"
  }
}
