//
//  IdusRepositoryType.swift
//  idus
//
//  Created by Seungjin on 03/12/2019.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Foundation

protocol IdusRepositoryType {

  func requestProductList(page: Int, completion: @escaping (NetworkDataResponse) -> Void)
}
