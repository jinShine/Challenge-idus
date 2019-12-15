//
//  Font.swift
//  idus
//
//  Created by seungjin on 2019/12/03.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

struct Font {

  //MARK:- Noto Sans
  func notoSansBlack(size: CGFloat) -> UIFont {
    return UIFont(name: "NotoSansCJKkr-Black", size: size) ?? UIFont.systemFont(ofSize: size)
  }
  
  func notoSansBold(size: CGFloat) -> UIFont {
    return UIFont(name: "NotoSansCJKkr-Bold", size: size) ?? UIFont.systemFont(ofSize: size)
  }
  
  //MARK:- SF Pro
  func sfProTextHeavy(size: CGFloat) -> UIFont {
    return UIFont(name: "SFProText-Heavy", size: size) ?? UIFont.systemFont(ofSize: size)
  }
  
  //MARK:- Apple SD GothicNeo
  func appleSDGothicNeoBold(size: CGFloat) -> UIFont {
    return UIFont(name: "AppleSDGothicNeo-Bold", size: size) ?? UIFont.systemFont(ofSize: size)
  }
  
}
