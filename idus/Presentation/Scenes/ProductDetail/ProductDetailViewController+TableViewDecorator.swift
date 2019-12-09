//
//  ProductDetailViewController+TableViewDecorator.swift
//  idus
//
//  Created by seungjin on 2019/12/06.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

//MARK:- TableView dataSource

extension ProductDetailViewController: UITableViewDataSource {

  func numberOfSections(in tableView: UITableView) -> Int {

    return viewModel.numberOfSections()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    return viewModel.numberOfRowsInSection()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    return configureCell(tableView: tableView, indexPath: indexPath)
  }

}

//MARK:- TableView delegate

extension ProductDetailViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch ProductDetailViewModel.CellType(rawValue: indexPath.row) {
    case .thumbnailList:
      return tableView.frame.width
    default:
      return UITableView.automaticDimension
    }
  }

  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    
    return UITableView.automaticDimension
  }

}

//MARK:- TableView Decorator

extension ProductDetailViewController: TableViewViewDecorator {
  
  func configureCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
    switch ProductDetailViewModel.CellType(rawValue: indexPath.row) {
    case .thumbnailList:
      guard let cell = tableView.dequeueReusableCell(
        withIdentifier: ThumbnailCollectionViewCell.reuseIdentifier, for: indexPath) as? ThumbnailCollectionViewCell else {
        return UITableViewCell()
      }
      let thumbnailList = viewModel.thumbnailList()
      cell.viewModel = ThumbnailCollectionViewCellViewModel(thumbnailList: thumbnailList)
      
      return cell

    case .productInfo:
      guard let cell = tableView.dequeueReusableCell(
        withIdentifier: ProductInfoCell.reuseIdentifier, for: indexPath) as? ProductInfoCell else {
        return UITableViewCell()
      }
      let productInfo = viewModel.productInfo()
      cell.viewModel = ProductInfoCellViewModel(seller: productInfo.seller, title: productInfo.title, discountRate: productInfo.discountRate, discountCost: productInfo.discountCost, cost: productInfo.cost)

      return cell

    case .description:
      guard let cell = tableView.dequeueReusableCell(
        withIdentifier: DescriptionCell.reuseIdentifier, for: indexPath) as? DescriptionCell else {
        return UITableViewCell()
      }
      cell.viewModel = DescriptionCellViewModel(description: viewModel.descriptionInfo())

      return cell

    case .notice:
      let cell = tableView.dequeueReusableCell(withIdentifier: NoticeCell.reuseIdentifier, for: indexPath)

      return cell
      
    default:
      return UITableViewCell()
    }
  }
}
