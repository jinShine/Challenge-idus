//
//  BaseViewController.swift
//  idus
//
//  Created by seungjin on 2019/12/02.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class BaseViewController: UIViewController {
  
  //MARK:- Init
  
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK:- Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupConstraints()
    bind()
  }
  
  deinit {
    DLog(String(describing: self))
  }


  //MARK:- Methods
  
  func setupUI() { }

  func setupConstraints() { }

  func bind() { }

  func setStatusBarViewBackground(_ color: UIColor) {
    if #available(iOS 13.0, *) {
      let app = UIApplication.shared
      let statusBarHeight: CGFloat = app.statusBarFrame.size.height

      let statusbarView = UIView()
      statusbarView.backgroundColor = color
      view.addSubview(statusbarView)

      statusbarView.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        statusbarView.heightAnchor.constraint(equalToConstant: statusBarHeight),
        statusbarView.widthAnchor.constraint(equalTo: view.widthAnchor),
        statusbarView.topAnchor.constraint(equalTo: view.topAnchor)
      ])

    } else {
      let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
      statusBar?.backgroundColor = color
    }
  }
  
}
