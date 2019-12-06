//
//  ProductDetailModel.swift
//  idus
//
//  Created by Seungjin on 06/12/2019.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Foundation

/*
 {
   "statusCode": 200,
   "body": [
     {
       "discount_cost": null,
       "cost": "35,000원",
       "seller": "잇츠깡스",
       "description": "갑자기 추워진 날씨\n조끼 하나로 든든하게 입어요~\n이너로 입기도도 \n두터운 티셔츠나 집업 위에 걸치기도 좋아서 \n자꾸 손이 가는 조끼입니다~.👍👍\n언제 어디든 어떤 코디든 \n찰떡 같이 잘 어울리는 멋스런 아이에요\n\n엄마와 함께~~ 아빠와 함께~👨‍👩‍👦👨‍👩‍👧👨‍👩‍👧‍👦\n이번에는 가족 모두 입을 수 있는 사이즈까지 제작했어요~ :D\n\n📌겉감은 세겹 거즈를 4온스 솜에 누빔한 원단이구요\n안감은 5미리 극세사를 사용해서 \n더 더 보온성을 높여서 \n엄청 따뜻 포근해요~^^\n\n📌색상 \n진회색\n\n📌사이즈\n\n아동 90 : 가슴반품 32 총장 41\n아동 100 : 가슴반품 34 총장 44\n아동 110 : 가슴반품 36 총장 47\n아동 120 : 가슴반품 38 총장 50\n아동 130 : 가슴반품 40 총장 53\n아동 140 : 가슴반품 43 총장 56\n\n성인 프리 : 가슴반품 51 총장 64\n성인 라지 : 가슴반품 58 총장 74\n\n핸드메이드 특성상 약간의 오차가 있을수 있습니다^^\n\n아이 사이즈는 키 기준으로 주문 주시면 되구요\n엄마사이즈는 77까지도 \n아빠 사이즈는 105사이즈 까지도 가능합니다.\n\n📌소재\n               겉감 3겹 거즈면 100%\n    안감 폴리 100%\n\n다른 문의 사항 있으시면 메세지 주세요~\n성실하게 답변해드리겠습니다~😄\n\n \n",
       "discount_rate": null,
       "id": 25,
       "thumbnail_720": "https://image.idus.com/image/files/32e5909bb6a146a3b635af07e0ce00a4_720.jpg",
       "thumbnail_list_320": "https://image.idus.com/image/files/32e5909bb6a146a3b635af07e0ce00a4_320.jpg#https://image.idus.com/image/files/528c20c1d982436d90bdb3f553185006_320.jpg#https://image.idus.com/image/files/066892c51c584ed49c45737630170e13_320.jpg#https://image.idus.com/image/files/f081ae05c104406ebecd3205fc978219_320.jpg#https://image.idus.com/image/files/a9aefddd99de4014ad236a32e7ea60ab_320.jpg#https://image.idus.com/image/files/bba1f20a092a437a8475b2dc35fae8dd_320.jpg",
       "title": "세겹거즈 누빔 조끼/양면 극세사 / 맘 커플"
     }
   ]
 }
 */

struct ProductDetailModel: Decodable {
  var statusCode: Int
  var body: [DetailContent]
}

struct DetailContent: Decodable {
  var id: Int
  var thumbnail: String
  var thumbnailList: String
  var seller: String
  var title: String
  var discountRate: String?
  var discountCost: String?
  var cost: String
  var description: String

  enum CodingKeys: String, CodingKey {
    case id, seller, title, cost, description
    case thumbnail = "thumbnail_720"
    case thumbnailList = "thumbnail_list_320"
    case discountRate = "discount_rate"
    case discountCost = "discount_cost"
  }
}
