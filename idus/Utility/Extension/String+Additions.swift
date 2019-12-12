//
//  String+Additions.swift
//  idus
//
//  Created by Seungjin on 12/12/2019.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Foundation

extension String {

  func cancelLine() -> NSMutableAttributedString {
    let attributed = NSMutableAttributedString(string: self)
    attributed.addAttributes([.baselineOffset : 0, .strikethroughStyle : 2], range: NSString(string: self).range(of: self))

    return attributed
  }
}
