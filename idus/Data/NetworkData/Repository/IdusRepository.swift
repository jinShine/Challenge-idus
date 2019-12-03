//
//  IdusRepository.swift
//  idus
//
//  Created by Seungjin on 03/12/2019.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Foundation

final class IdusRepository {

  private let networkService: NetworkService

  init(networkService: NetworkService = NetworkService()) {
    self.networkService = networkService
  }

}

extension IdusRepository: IdusRepositoryType {

  func requestProductList(completion: @escaping (NetworkDataResponse) -> Void) {
    networkService.buildRequest(to: .productsList, decoder: ProductModel.self, completion: completion)
  }
}
