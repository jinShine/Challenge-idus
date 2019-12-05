//
//  ProductDetailViewController.swift
//  idus
//
//  Created by Seungjin on 05/12/2019.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

final class ProductDetailViewController: BaseViewController {

  //MARK:- Constant

  struct UI {
  }


  //MARK:- UI Properties



  //MARK:- Properties

  let viewModel: ProductDetailViewModel


  //MARK:- Init

  init(viewModel: ProductDetailViewModel) {
    self.viewModel = viewModel

    super.init()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  //MARK:- Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    bind()
  }


  //MARK:- Methods

  override func setupUI() {

  }

  override func setupConstraints() {

  }

  private func bind() {

  }

}
