//
//  InfomationCell.swift
//  idus
//
//  Created by seungjin on 2019/12/09.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

class InfomationCell: BaseCollectionViewCell {

  //MARK:- Constant

  struct UI {

  }

  //MARK:- UI Properties

  let sellerLabel: UILabel = {
    let label = UILabel()
    label.textColor = App.color.darkSkyBlue
    label.font = App.font.notoSansBlack(size: 12)
    label.textAlignment = .left
    label.setLineSpacing(lineSpacing: 0, lineHeightMultiple: 20)
    return label
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = App.color.dark
    label.font = App.font.sfProTextHeavy(size: 40)
    label.textAlignment = .left
    label.setLineSpacing(lineSpacing: 0, lineHeightMultiple: 48)
    return label
  }()
  
  let discountRateLabel: UILabel = {
    let label = UILabel()
    label.textColor = App.color.coralPink
    label.font = App.font.sfProTextHeavy(size: 20)
    label.textAlignment = .left
    label.setLineSpacing(lineSpacing: 0, lineHeightMultiple: 24)
    return label
  }()
  
  let discountCostLabel: UILabel = {
    let label = UILabel()
    label.textColor = App.color.dark
    label.font = App.font.sfProTextHeavy(size: 20)
    label.textAlignment = .left
    label.setLineSpacing(lineSpacing: 0, lineHeightMultiple: 24)
    return label
  }()
  
  let costLabel: UILabel = {
    let label = UILabel()
    label.textColor = App.color.blueGrey
    label.font = App.font.appleSDGothicNeoBold(size: 20)
    label.textAlignment = .left
    label.setLineSpacing(lineSpacing: 0, lineHeightMultiple: 24)
    return label
  }()
  
  lazy var costStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [
      discountRateLabel,
      discountCostLabel,
      costLabel
    ])
    stackView.alignment = .leading
    stackView.axis = .horizontal
    return stackView
  }()
  
  let lineView: UIView = {
    let view = UIView()
    view.backgroundColor = App.color.paleGreyTwo
    return view
  }()

  //MARK:- Properties

  var viewModel: InfomationCellViewModel! {
    didSet {
      
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
    
  }

  override func setupConstraints() {
   
  }

}
