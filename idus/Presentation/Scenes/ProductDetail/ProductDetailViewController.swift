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
    static let dismissButtonSize: CGFloat = 40
    static let dismissButtonMargin: CGFloat = 16
  }


  //MARK:- UI Properties

  lazy var dismissButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "dismiss"), for: .normal)
    button.imageView?.contentMode = .scaleAspectFit
    button.backgroundColor = App.color.darkAlpha
    button.layer.cornerRadius = UI.dismissButtonSize / 2
    button.layer.masksToBounds = true
    button.addTarget(self, action: #selector(didTapDismissAction), for: .touchUpInside)
    return button
  }()
  
  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.estimatedRowHeight = 80
    tableView.rowHeight = UITableView.automaticDimension
    tableView.delegate = self
    tableView.dataSource = self
    
    tableView.register(ThumbnailCollectionViewCell.classForCoder(),
                       forCellReuseIdentifier: ThumbnailCollectionViewCell.reuseIdentifier)

    return tableView
  }()


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
  }


  //MARK:- Methods

  override func setupUI() {
    self.navigationController?.setNavigationBarHidden(true, animated: false)

    [tableView, dismissButton].forEach { view.addSubview($0) }

  }

  override func setupConstraints() {
    
    dismissButton.snp.makeConstraints {
      $0.top.equalToSuperview().offset(UI.dismissButtonMargin)
      $0.trailing.equalToSuperview().offset(-UI.dismissButtonMargin)
      $0.size.equalTo(UI.dismissButtonSize)
    }
    
    tableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  override func bind() {

    viewModel.fetchProductDetail { [weak self] response in
      if response.result == .failure {
        DLog(response.error?.message)
        return
      }

      self?.reload()
    }

  }

  func reload() {
    DispatchQueue.main.async { [weak self] in
      self?.tableView.reloadData()
    }
  }
  
  @objc
  func didTapDismissAction() {
    self.dismiss(animated: true, completion: nil)
  }

}
