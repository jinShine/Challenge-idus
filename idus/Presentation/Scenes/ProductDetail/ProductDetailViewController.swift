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
    struct DismissButton {
      static let size: CGFloat = 40
      static let margin: CGFloat = 16
    }
    struct TableView {
      static let estimateRowHeight: CGFloat = 100
    }
    struct PurchaseButton {
      static let cornerRadius: CGFloat = 14
      static let bottomMargin: CGFloat = -30
      static let leadingMargin: CGFloat = 24
      static let trailingMargin: CGFloat = -24
      static let height: CGFloat = 52
    }
  }


  //MARK:- UI Properties

  lazy var dismissButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "dismiss"), for: .normal)
    button.imageView?.contentMode = .scaleAspectFit
    button.backgroundColor = App.color.darkAlpha
    button.layer.cornerRadius = UI.DismissButton.size / 2
    button.layer.masksToBounds = true
    button.addTarget(self, action: #selector(didTapDismissAction), for: .touchUpInside)
    return button
  }()
  
  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.estimatedRowHeight = UI.TableView.estimateRowHeight
    tableView.rowHeight = UITableView.automaticDimension
    tableView.delegate = self
    tableView.dataSource = self
    
    tableView.register(ThumbnailCollectionViewCell.classForCoder(),
                       forCellReuseIdentifier: ThumbnailCollectionViewCell.reuseIdentifier)

    return tableView
  }()
  
  let purchaseButton: UIButton = {
    let button = UIButton()
    button.setTitle("구매하기", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = App.font.notoSansBlack(size: 18)
    button.titleLabel?.textAlignment = .center
    button.backgroundColor = App.color.coralPink
    button.layer.cornerRadius = UI.PurchaseButton.cornerRadius
    button.layer.masksToBounds = true
    return button
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

    [tableView, dismissButton, purchaseButton].forEach { view.addSubview($0) }

  }

  override func setupConstraints() {
    
    dismissButton.snp.makeConstraints {
      $0.top.equalToSuperview().offset(UI.DismissButton.margin)
      $0.trailing.equalToSuperview().offset(-UI.DismissButton.margin)
      $0.size.equalTo(UI.DismissButton.size)
    }
    
    tableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    
    purchaseButton.snp.makeConstraints {
      $0.bottom.equalToSuperview().offset(UI.PurchaseButton.bottomMargin)
      $0.leading.equalToSuperview().offset(UI.PurchaseButton.leadingMargin)
      $0.trailing.equalToSuperview().offset(UI.PurchaseButton.trailingMargin)
      $0.height.equalTo(UI.PurchaseButton.height)
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
