//
//  ProductListViewController.swift
//  idus
//
//  Created by seungjin on 2019/12/02.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

final class ProductListViewController: BaseViewController {
  
  //MARK: - Constant
  struct Constant { }


  //MARK: - UI Properties
  

  //MARK: - Properties
  let viewModel: ProductListViewModel
  
  
  //MARK: - init
  init(viewModel: ProductListViewModel) {
    self.viewModel = viewModel
    
    super.init()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  //MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  
  //MARK: - Methods
  
  
}
