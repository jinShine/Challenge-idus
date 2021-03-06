//
//  IdusUseCase.swift
//  idus
//
//  Created by Seungjin on 03/12/2019.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Foundation

protocol IdusUseCase {

  func executeProductList(page: Int, completion: @escaping (NetworkDataResponse) -> Void)
  func executeProductDetail(id: Int, completion: @escaping (NetworkDataResponse) -> Void)
}

final class IdusUseCaseImpl: IdusUseCase {

  private let idusRepository: IdusRepositoryType

  init(idusRepository: IdusRepositoryType) {
    self.idusRepository = idusRepository
  }

  func executeProductList(page: Int, completion: @escaping (NetworkDataResponse) -> Void) {
    idusRepository.requestProductList(page: page, completion: completion)
  }

  func executeProductDetail(id: Int, completion: @escaping (NetworkDataResponse) -> Void) {
    idusRepository.requestProductDetail(id: id, completion: completion)
  }

}
