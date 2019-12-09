//
//  Navigator.swift
//  idus
//
//  Created by seungjin on 2019/12/02.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

struct Navigator {

  enum Scene {
    case productList
    case productDetail(id: Int)
  }

  func navigate(at scene: Scene) -> UIViewController {
    switch scene {
    case .productList:
      let viewModel = ProductListViewModel(
        idusUseCase: IdusUseCaseImpl(
          idusRepository: IdusRepository()
        )
      )
      let viewController = ProductListViewController(viewModel: viewModel, navigator: self)
      let navigationController = BaseNavigationController(rootViewController: viewController)

      return navigationController

    case .productDetail(let id):
      let viewModel = ProductDetailViewModel(
        idusUseCase: IdusUseCaseImpl(
          idusRepository: IdusRepository()
        ),
        id: id
      )
      let viewController = ProductDetailViewController(viewModel: viewModel)
      viewController.modalPresentationStyle = .pageSheet
      return viewController
    }
  }

}
