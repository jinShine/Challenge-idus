//
//  ZoomAnimator.swift
//  idus
//
//  Created by Seungjin on 11/12/2019.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

class ZoomAnimator: NSObject, UIViewControllerAnimatedTransitioning {

  //MARK:- Constant

  struct UI {
    static let presentDuration: TimeInterval = 0.75
    static let alphaMin: CGFloat = 0.0
    static let alphaMax: CGFloat = 1.0
    static let cornerRadius: CGFloat = 30
  }


  //MARK:- Properties

  var duration = UI.presentDuration
  var presenting = true

  var targetIndexPath: IndexPath?
  var targetImageView = UIImageView()


  //MARK:- animated transitioning

  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {

    return duration
  }

  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    let containerView = transitionContext.containerView

    if presenting {
      guard let fromVC = transitionContext.viewController(forKey: .from)?.children.last as? ProductListViewController else { fatalError() }
      guard let toVC = transitionContext.viewController(forKey: .to) as? ProductDetailViewController else { fatalError() }

      guard let fromView = fromVC.view else { fatalError() }
      guard let toView = toVC.view else { fatalError() }

      toView.alpha = UI.alphaMin
      fromView.alpha = UI.alphaMin

      containerView.addSubview(toView)

      let targetCell = fromVC.collectionView.cellForItem(at: targetIndexPath!)
      let startFrame = fromVC.collectionView.convert(targetCell!.frame, to: fromView)

      targetImageView.alpha = UI.alphaMax
      targetImageView.frame = startFrame
      targetImageView.clipsToBounds = true
      targetImageView.contentMode = .scaleAspectFill
      targetImageView.layer.cornerRadius = UI.cornerRadius

      containerView.addSubview(targetImageView)

      let finalFrame = CGRect(x: toView.frame.origin.x,
                              y: UIApplication.shared.statusBarFrame.height,
                              width: toView.frame.width, height: toView.frame.width)

      UIView.animate(withDuration: duration, animations: {
        self.targetImageView.frame = finalFrame
      }, completion: { _ in
        toView.alpha = UI.alphaMax
        fromView.alpha = UI.alphaMax
        self.targetImageView.alpha = UI.alphaMin
        self.targetImageView.removeFromSuperview()

        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
      })

    }
  }

}
