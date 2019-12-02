//
//  Font.swift
//  idus
//
//  Created by seungjin on 2019/12/03.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

struct Font {

  func notoSansBlack(size: CGFloat) -> UIFont {
    return UIFont(name: "NotoSansCJKkr-Black", size: size) ?? UIFont.systemFont(ofSize: size)
  }
  
  func notoSansBold(size: CGFloat) -> UIFont {
    return UIFont(name: "NotoSansCJKkr-Bold", size: size) ?? UIFont.systemFont(ofSize: size)
  }
  
  func notoSansThin(size: CGFloat) -> UIFont {
    return UIFont(name: "NotoSansCJKkr-Thin", size: size) ?? UIFont.systemFont(ofSize: size)
  }
  
  func notoSansRegular(size: CGFloat) -> UIFont {
    return UIFont(name: "NotoSansCJKkr-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
  }
  
  func notoSansLight(size: CGFloat) -> UIFont {
    return UIFont(name: "NotoSansCJKkr-Light", size: size) ?? UIFont.systemFont(ofSize: size)
  }
  
  func notoSansDemiLight(size: CGFloat) -> UIFont {
    return UIFont(name: "NotoSansCJKkr-DemiLight", size: size) ?? UIFont.systemFont(ofSize: size)
  }
  
  func notoSansMedium(size: CGFloat) -> UIFont {
    return UIFont(name: "NotoSansCJKkr-Medium", size: size) ?? UIFont.systemFont(ofSize: size)
  }
  
}
