//
//  BaseNavigationController.swift
//  idus
//
//  Created by seungjin on 2019/12/02.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
  
  //MARK:- Constant
  struct UI {
    static let layerColor: UIColor = UIColor(r: 24, g: 24, b: 80, a: 0.12)
  }
  
  //MARK:- Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  //MARK:- Methods
  private func setupUI() {
    navigationBar.shadowImage = UIImage()
    navigationBar.isTranslucent = false
    navigationBar.layer.applyShadow(color: UI.layerColor, alpha: 1, x: 0, y: 2, blur: 4)
  }
  
}
