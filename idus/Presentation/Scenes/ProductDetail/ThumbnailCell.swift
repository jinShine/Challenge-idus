//
//  ThumbnailCell.swift
//  idus
//
//  Created by Seungjin on 06/12/2019.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

class ThumbnailCell: BaseCollectionViewCell {

  //MARK:- Constant

  struct UI {
    static let contentCornerRadius: CGFloat = 30
  }

  //MARK:- UI Properties

  let thumbnailImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    return imageView
  }()


  //MARK:- Properties

  var viewModel: ThumbnailCellViewModel! {
    didSet {
      let imageURL = URL(string: viewModel.thumbnail)
      thumbnailImageView.kf.setImage(with: imageURL)
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

    clipsToBounds = true
    layer.cornerRadius = UI.contentCornerRadius
    layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

    contentView.addSubview(thumbnailImageView)
  }

  override func setupConstraints() {
    thumbnailImageView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }

}
