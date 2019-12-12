//
//  ThumbnailCell.swift
//  idus
//
//  Created by seungjin on 2019/12/06.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

final class ThumbnailCollectionViewCell: BaseTableViewCell {
  
  //MARK:- Constant
  
  struct UI {
    struct ProgressView {
      static let margin: CGFloat = 24
      static let height: CGFloat = 4
      static let cornerRadius: CGFloat = 4
    }
  }
  
  //MARK:- UI Properties
  
  lazy var thumbnailCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.isPagingEnabled = true
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.dataSource = self
    collectionView.delegate = self

    collectionView.register(ThumbnailCell.classForCoder(),
                            forCellWithReuseIdentifier: ThumbnailCell.reuseIdentifier)
    
    return collectionView
  }()


  let progressView: UIProgressView = {
    let progress = UIProgressView()
    progress.progressTintColor = .white
    progress.backgroundColor = App.color.darkNavyBlue
    progress.layer.cornerRadius = UI.ProgressView.cornerRadius
    return progress
  }()

  
  
  
  //MARK:- Properties
  
  var viewModel: ThumbnailCollectionViewCellViewModel! {
    didSet {
      self.reload()
      self.progressInitialValue()
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
    [thumbnailCollectionView, progressView].forEach { self.addSubview($0) }
  }
  
  override func setupConstraints() {
    thumbnailCollectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    
    progressView.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(UI.ProgressView.margin)
      $0.trailing.bottom.equalToSuperview().offset(-UI.ProgressView.margin)
      $0.height.equalTo(UI.ProgressView.height)
    }
  }

  func reload() {
    DispatchQueue.main.async { [weak self] in
      self?.thumbnailCollectionView.reloadData()
    }
  }
  
  func progressInitialValue() {
    progressView.setProgress(
      Float(0.0 / thumbnailCollectionView.frame.width) + 1 / Float(viewModel.thumbnailList.count
    ), animated: false)
  }

}
