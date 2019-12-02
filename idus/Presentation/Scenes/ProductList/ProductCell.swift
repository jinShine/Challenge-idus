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
    static let productImageSize: CGFloat = 172
  }
  
  //MARK:- UI Properties
  let productImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.image = UIImage(named: "storefront")
    return imageView
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 2
    label.font = App.font.notoSansBlack(size: 14)
    label.textColor = App.color.dark
    label.text = "반려동물 키링+일러스트 배경화면/ 드로잉키링"
    return label
  }()
  
  let sellerLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 1
    label.font = App.font.notoSansBold(size: 14)
    label.textColor = App.color.blueGrey
    label.text = "작은작업실"
    return label
  }()
  
  lazy var containerStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [
      self.titleLabel,
      self.sellerLabel
    ])
    stackView.axis = .vertical
    return stackView
  }()
  
  
  //MARK:- Life Cycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupUI()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  
  //MARK:- Methods
  private func setupUI() {
    
    productImageView.layer.applyShadow(color: App.color.darkBlueGrey, alpha: 0, x: 0, y: 0, blur: 0, spread: 1)
  }
  
  private func setupConstraints() {
    
    [productImageView, containerStackView].forEach {
      contentView.addSubview($0)
    }
    
    productImageView.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
      $0.size.equalTo(UI.productImageSize)
    }
    
    containerStackView.snp.makeConstraints {
      $0.top.equalTo(productImageView.snp.bottom).offset(4).priority(.high)
      $0.leading.equalToSuperview().offset(8)
      $0.trailing.equalToSuperview().offset(-8)
      $0.bottom.equalToSuperview().priority(.low)
    }
  
  }
  
}
