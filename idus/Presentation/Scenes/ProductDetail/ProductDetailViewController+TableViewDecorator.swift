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
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
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
      return .zero
    }
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
      let thumbnailList = viewModel.thumbnailList
      cell.viewModel = ThumbnailCollectionViewCellViewModel(thumbnailList: thumbnailList)
      
      return cell
      
    default:
      return UITableViewCell()
    }
  }
}
