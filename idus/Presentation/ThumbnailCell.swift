//
//  ThumbnailCell.swift
//  idus
//
//  Created by seungjin on 2019/12/06.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

final class ThumbnailCell: BaseTableViewCell {
  
  //MARK:- Constant
  
  struct UI {
   
  }
  
  //MARK:- UI Properties
  
  lazy var imageCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .white
//    collectionView.dataSource = self
//    collectionView.delegate = self
//
//    collectionView.register(ProductCell.classForCoder(), forCellWithReuseIdentifier: ProductCell.reuseIdentifier)
//    collectionView.register(RefreshFooterView.classForCoder(),
//                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
//                            withReuseIdentifier: RefreshFooterView.reuseIdentifier)
    
    return collectionView
  }()
  
  
  
  //MARK:- Properties
  
  var viewModel: ThumbnailCellViewModel! {
    didSet {

    }
  }
  
  
  //MARK:- Init
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  //MARK:- Methods
  
  override func setupUI() {
    [imageCollectionView].forEach { self.addSubview($0) }
  }
  
  override func setupConstraints() {
    imageCollectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }

}
