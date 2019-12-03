//
//  Navigator.swift
//  idus
//
//  Created by seungjin on 2019/12/02.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

enum Navigator {
  case productList
}

extension Navigator {
  
  var navigate: UIViewController {
    switch self {
    case .productList:
      let viewModel = ProductListViewModel(
        idusUseCase: IdusUseCaseImpl(idusRepository: IdusRepository())
      )
      let viewController = ProductListViewController(viewModel: viewModel)
      let navigationController = BaseNavigationController(rootViewController: viewController)
      
      return navigationController
    }
  }
}
