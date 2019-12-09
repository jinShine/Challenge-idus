//
//  PopAnimator.swift
//  idus
//
//  Created by Seungjin on 09/12/2019.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {

  enum PopTransitionMode: Int {
    case present, dismiss
  }

  var transitionMode: PopTransitionMode = .present
  var origin: CGPoint = .zero
  let presentDuration = 0.5
  let dismissDuration = 0.3

  var imageView: UIImageView?

  func frameForImage(center: CGPoint, size: CGSize, start: CGPoint) -> CGRect {

    let lengthX = fmax(start.x, size.width - start.x)
    let lengthY = fmax(start.y, size.height - start.y)
    let offset = sqrt(lengthX * lengthX + lengthY * lengthY) * 2
    let size = CGSize(width: offset, height: offset)

    return CGRect(origin: .zero, size: size)
  }

  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    if transitionMode == .present {
      return presentDuration
    } else {
      return dismissDuration
    }
  }

  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

    let containerView = transitionContext.containerView

    switch transitionMode {
    case .present:

      let presentedView = transitionContext.view(forKey: .to)!
      let originalCenter = presentedView.center
      let originalSize = presentedView.frame.size

      imageView = UIImageView(frame: frameForImage(center: originalCenter, size: originalSize, start: origin))
      imageView?.layer.cornerRadius = imageView!.frame.size.height / 2
      imageView?.center = origin

      imageView?.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)

      containerView.addSubview(imageView!)

      presentedView.center = origin
      presentedView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)

      containerView.addSubview(presentedView)

      UIView.animate(withDuration: presentDuration, animations: {
        self.imageView!.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        presentedView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        presentedView.center = originalCenter
      }, completion: { _ in
        transitionContext.completeTransition(true)
      })

    case .dismiss:

      let fromControllView = transitionContext.view(forKey: .from)!
      let originalCenter = fromControllView.center
      let originalSize = fromControllView.frame.size

      imageView?.frame = frameForImage(center: originalCenter, size: originalSize, start: origin)
      imageView?.layer.cornerRadius = imageView!.frame.size.height / 2
      imageView?.center = origin

      UIView.animate(withDuration: presentDuration, animations: {
        self.imageView!.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
        fromControllView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
        fromControllView.center = self.origin
        fromControllView.alpha = 0
      }, completion: { _ in
        transitionContext.completeTransition(true)
      })
    }
//    let containerView = transitionContext.containerView
//    let fromView = transitionContext.viewController(forKey: .from)!.view
//    let toView = transitionContext.viewController(forKey: .to)!.view
//
////    let fromImageView = UIImageView()
////    let toImageView = UIImageView()
//
//    containerView.addSubview(fromView!)
//
//    toView?.alpha = 0.0
//
//    containerView.addSubview(toView!)
//
//    UIView.animate(withDuration: duration, animations: {
//        // We do animations here, something like,
////        fromImageView.frame = (toView?.frame)! // With some checking around the view relative frames
//        toView?.alpha = 1.0
//    }) { (completed) in
//        // Do clean up here, after this completeTransition(true) method,
//        // the comtainer will be removed from the screen and toView will be shown automatically
//        transitionContext.completeTransition(true)
//    }


//    let containerView = transitionContext.containerView
//    let toView = transitionContext.view(forKey: .to) ?? UIView()
//    let detailView = presenting ? toView : transitionContext.view(forKey: .from)!
//
//    let initialFrame = presenting ? originFrame : detailView.frame
//    let finalFrame = presenting ? detailView.frame : originFrame
//
//    let xScaleFactor = presenting ?
//      initialFrame.width / finalFrame.width :
//      finalFrame.width / initialFrame.width
//
//    let yScaleFactor = presenting ?
//      initialFrame.height / finalFrame.height :
//      finalFrame.height / initialFrame.height
//
//    let scaleTransform = CGAffineTransform(scaleX: xScaleFactor, y: yScaleFactor)
//
//    if presenting {
//      detailView.transform = scaleTransform
//      detailView.center = CGPoint(
//        x: initialFrame.midX,
//        y: initialFrame.midY)
//      detailView.clipsToBounds = true
//    }
////
////    detailView.layer.cornerRadius = presenting ? 20.0 : 0.0
////    detailView.layer.masksToBounds = true
//
//    containerView.addSubview(toView)
//    containerView.bringSubviewToFront(detailView)
//
//    UIView.animate(
//      withDuration: duration,
//      animations: {
//        detailView.transform = self.presenting ? .identity : scaleTransform
//        detailView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
////        detailView.layer.cornerRadius = !self.presenting ? 20.0 : 0.0
//    }, completion: { _ in
//      if !self.presenting {
//        self.dismissCompletion?()
//      }
//      transitionContext.completeTransition(true)
//    })
  }

}
