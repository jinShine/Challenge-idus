//
//  AppDelegate.swift
//  idus
//
//  Created by seungjin on 2019/12/02.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    setupRoot()
    
    return true
  }
  
  private func setupRoot() {
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = Navigator.productList.navigate
    window.backgroundColor = .white
    window.makeKeyAndVisible()
    self.window = window
  }
  
}

