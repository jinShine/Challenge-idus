//
//  Navigator.swift
//  idus
//
//  Created by seungjin on 2019/12/02.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit
import Swinject

class Navigator {

  var container = Container()

  init() {
    setupRegistration()
  }

  private func setupRegistration() {

    //MARK: Network
    container.register(NetworkServiceType.self) { _ in NetworkService() }

    //MARK: Repository
    container.register(IdusRepositoryType.self) { r in
      IdusRepository(networkService: r.resolve(NetworkServiceType.self)!)
    }

    //MARK: UseCase
    container.register(IdusUseCase.self) { r in
      IdusUseCaseImpl(idusRepository: r.resolve(IdusRepositoryType.self)!)
    }

    //MARK: Scene

    // list
    container.register(BaseNavigationController.self) { r in
      let viewModel = ProductListViewModel(idusUseCase: IdusUseCaseImpl(
        idusRepository: r.resolve(IdusRepositoryType.self)!)
      )
      let viewController = ProductListViewController(viewModel: viewModel, navigator: self, transition: ZoomAnimator())
      let navigationController = BaseNavigationController(rootViewController: viewController)
      return navigationController
    }

    // detail
    container.register(ProductDetailViewController.self) { (r, id: Int) in
      let viewModel = ProductDetailViewModel(idusUseCase: r.resolve(IdusUseCase.self)!, id: id)
      let viewController = ProductDetailViewController(viewModel: viewModel)
      return viewController
    }
  }

}
