//
//  UIView+Additions.swift
//  idus
//
//  Created by seungjin on 2019/12/02.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

extension UIView {

  static var reuseIdentifier: String {
      let nameSpaceClassName = NSStringFromClass(self)
      guard let className = nameSpaceClassName.components(separatedBy: ".").last else {
          return nameSpaceClassName
      }
      return className
  }
  
}
