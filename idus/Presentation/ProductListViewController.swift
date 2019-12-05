//
//  ProductListViewController.swift
//  idus
//
//  Created by seungjin on 2019/12/02.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit
import SnapKit

final class ProductListViewController: BaseViewController {
  
  //MARK:- Constant
  
  struct UI {

    static let maxTitleHeight: CGFloat = 40
    static let maxSellerHeight: CGFloat = 20
    static let titleTopMargin: CGFloat = 4

    struct CollectionView {
      static let inset: UIEdgeInsets = UIEdgeInsets(top: 24, left: 12, bottom: 24, right: 12)
      static let column: CGFloat = 2
      static let itemSpacing: CGFloat = 7
      static let lineSpacing: CGFloat = 24
    }
  }


  //MARK:- UI Properties


  var refreshFooterView: RefreshFooterView?

  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.footerReferenceSize = CGSize(width: view.frame.width, height: 30)
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .white
    collectionView.dataSource = self
    collectionView.delegate = self
    
    collectionView.register(ProductCell.classForCoder(), forCellWithReuseIdentifier: ProductCell.reuseIdentifier)
    collectionView.register(RefreshFooterView.classForCoder(),
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                            withReuseIdentifier: RefreshFooterView.reuseIdentifier)
    
    return collectionView
  }()
  
  

  //MARK:- Properties
  
  let viewModel: ProductListViewModel
  
  
  //MARK:- Init
  
  init(viewModel: ProductListViewModel) {
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
    
    [collectionView].forEach { view.addSubview($0) }
    
    //Navigation
    let naviImage = UIImage(named: "storefront")
    navigationItem.titleView = UIImageView(image: naviImage)
    
  }
  
  override func setupConstraints() {
    collectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }

  private func bind() {
    fetchProductList()
  }

  private func fetchProductList() {

    viewModel.updateProductList(page: viewModel.pageCount) { [weak self] response in
      if response.result == .failure {
        DLog(response.error?.message)
        return
      }

      self?.reload()
    }

  }

  func reload() {
    self.refreshFooterView?.startRefreshing()
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
      self?.collectionView.reloadData()
    }
  }
  
}
