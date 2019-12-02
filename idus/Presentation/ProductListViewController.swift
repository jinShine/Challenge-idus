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
    
    struct CollectionView {
      static let inset: UIEdgeInsets = UIEdgeInsets(top: 24, left: 12, bottom: 24, right: 12)
      static let height: CGFloat = 236
      static let column: CGFloat = 2
      static let itemSpacing: CGFloat = 7
      static let lineSpacing: CGFloat = 24
    }
  }


  //MARK:- UI Properties
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .white
    collectionView.dataSource = self
    collectionView.delegate = self
    
    collectionView.register(ProductCell.classForCoder(), forCellWithReuseIdentifier: ProductCell.reuseIdentifier)
    
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

    setupUI()
    setupConstraints()
  }
  
  
  //MARK:- Methods
  
  private func setupUI() {
    
    //Navigation
    let naviImage = UIImage(named: "storefront")
    navigationItem.titleView = UIImageView(image: naviImage)
    
  }
  
  private func setupConstraints() {
    
    [collectionView].forEach { view.addSubview($0) }

    collectionView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.leading.trailing.bottom.equalToSuperview()
    }
    
    
    
  }
  
}

extension ProductListViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseIdentifier, for: indexPath) as! ProductCell
    
    if indexPath.row == 2 {
        cell.titleLabel.text = "라탄오브제"
    }
    
    
    return cell
  }
  
}

extension ProductListViewController: UICollectionViewDelegate {
    
  func collectionView(_ collectionView: UICollectionView,
                      didSelectItemAt indexPath: IndexPath) {
    
  }
  
}

extension ProductListViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let calculatedWidth = (collectionView.frame.width / UI.CollectionView.column)
      - (UI.CollectionView.inset.left * UI.CollectionView.column)
      - (UI.CollectionView.itemSpacing / UI.CollectionView.column)
    
    return CGSize(width: calculatedWidth , height: UI.CollectionView.height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    
    return UI.CollectionView.inset
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    
    return UI.CollectionView.itemSpacing
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    
    return UI.CollectionView.lineSpacing
  }
  
}
