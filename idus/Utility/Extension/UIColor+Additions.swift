//
//  UIColor+Additions.swift
//  idus
//
//  Created by seungjin on 2019/12/02.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

extension UIColor {
  
  convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat? = nil) {
    self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: a ?? 255 / 255)
  }
  
}
