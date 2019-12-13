//
//  IdusRepository.swift
//  idus
//
//  Created by Seungjin on 03/12/2019.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Foundation

final class IdusRepository {

  private let networkService: NetworkServiceType

  init(networkService: NetworkServiceType = NetworkService()) {
    self.networkService = networkService
  }

}

extension IdusRepository: IdusRepositoryType {

  func requestProductList(page: Int, completion: @escaping (NetworkDataResponse) -> Void) {
    networkService.buildRequest(to: .productList(page: page), decoder: ProductModel.self, completion: completion)
  }

  func requestProductDetail(id: Int, completion: @escaping (NetworkDataResponse) -> Void) {
    networkService.buildRequest(to: .productDetail(id: id), decoder: ProductDetailModel.self, completion: completion)
  }
}
