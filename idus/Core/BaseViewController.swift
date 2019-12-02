//
//  BaseViewController.swift
//  idus
//
//  Created by seungjin on 2019/12/02.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

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
    
    NetworkService().buildRequest(to: .productsDetail(page: "Adsfadfa")) { response in
      do {
        let result = try JSONDecoder().decode(IdusErrorModel.self, from: response.jsonData!)
        print("RESULT!!!!!!!!!", result)
      } catch {
        print("Decodable!!!!!!!!!", error)
      }
      
      
    }
  }
  
  deinit {
    print("DEINIT: ", String(describing: self))
  }
  
}
