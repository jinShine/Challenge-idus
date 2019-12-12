//
//  ProductCell.swift
//  idus
//
//  Created by seungjin on 2019/12/02.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

final class ProductCell: BaseCollectionViewCell {
  
  //MARK:- Constant
  
  struct UI {
    static let productImageRadius: CGFloat = 14
    static let titleTopMargin: CGFloat = 4
    static let titleLeftMargin: CGFloat = 8
    static let titleRightMargin: CGFloat = -8
    static let sellerHeight: CGFloat = 20
  }
  
  //MARK:- UI Properties
  
  let productImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.layer.cornerRadius = UI.productImageRadius
    return imageView
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 2
    label.font = App.font.notoSansBlack(size: 14)
    label.textColor = App.color.dark
    return label
  }()
  
  let sellerLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 1
    label.font = App.font.notoSansBold(size: 14)
    label.textColor = App.color.blueGrey
    return label
  }()
  
  
  //MARK:- Properties
  
  var viewModel: ProductCellViewModel! {
    didSet {
      let imageURL = URL(string: viewModel.productImage)
      productImageView.kf.setImage(with: imageURL)
      titleLabel.text = viewModel.title
      sellerLabel.text = viewModel.seller
    }
  }
  
  
  //MARK:- Life Cycle
  
  override init(frame: CGRect) {
    super.init(frame: frame)

  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  //MARK:- Methods
  
  override func setupUI() {
    
    [productImageView, titleLabel, sellerLabel].forEach {
      contentView.addSubview($0)
    }
    
    productImageView.layer.applyShadow(color: App.color.darkBlueGrey, alpha: 0, x: 0, y: 0, blur: 0, spread: 1)
  }
  
  override func setupConstraints() {
    
    productImageView.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
      $0.height.equalTo(productImageView.snp.width)
    }

    titleLabel.snp.makeConstraints {
      $0.top.equalTo(productImageView.snp.bottom).offset(UI.titleTopMargin)
      $0.leading.equalTo(productImageView).offset(UI.titleLeftMargin)
      $0.trailing.equalTo(productImageView).offset(UI.titleRightMargin)
      $0.height.greaterThanOrEqualTo(UI.sellerHeight)
    }
    
    sellerLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom)
      $0.leading.equalTo(titleLabel)
      $0.trailing.equalTo(titleLabel)
      $0.bottom.lessThanOrEqualToSuperview()
      $0.height.equalTo(UI.sellerHeight)
    }

  }
  
}
