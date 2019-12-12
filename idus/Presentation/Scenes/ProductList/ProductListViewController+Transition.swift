//
//  ProductListViewController+Transition.swift
//  idus
//
//  Created by Seungjin on 12/12/2019.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

extension ProductListViewController: UIViewControllerTransitioningDelegate {

  func animationController(
    forPresented presented: UIViewController,
    presenting: UIViewController, source: UIViewController
  ) -> UIViewControllerAnimatedTransitioning? {
    transition.presenting = true

    return transition
  }

  func animationController(
    forDismissed dismissed: UIViewController
  ) -> UIViewControllerAnimatedTransitioning? {

    return nil
  }
}

