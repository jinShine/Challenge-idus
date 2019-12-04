//
//  ProductListViewController+CollectionViewDecorator.swift
//  idus
//
//  Created by Seungjin on 03/12/2019.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

//MARK:- Collection view data source

extension ProductListViewController: UICollectionViewDataSource {

  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return viewModel.numberOfItemsInSection()
  }

  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    return configureCell(collectionView: collectionView, indexPath: indexPath)
  }

}

//MARK:- Collection view delegate

extension ProductListViewController: UICollectionViewDelegate {

  func collectionView(_ collectionView: UICollectionView,
                      didSelectItemAt indexPath: IndexPath) {

  }
  
  func collectionView(_ collectionView: UICollectionView,
                      willDisplay cell: UICollectionViewCell,
                      forItemAt indexPath: IndexPath) {

    refreshFooterView?.startRefreshing()
    viewModel.loadMore(at: indexPath) { [weak self] success in
      self?.refreshFooterView?.endRefreshing()
      if success {
        self?.reload()
        DLog(self?.viewModel.productList)
      }
    }

  }

  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

    switch kind {
    case UICollectionView.elementKindSectionHeader: return UICollectionReusableView()
    case UICollectionView.elementKindSectionFooter:
      let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: RefreshFooterView.reuseIdentifier, for: indexPath) as! RefreshFooterView
      refreshFooterView = footer
      return footer
    default:
      fatalError("Unknow kind")
    }
  }

}

//MARK:- Collection view flow layout

extension ProductListViewController: UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {

    let calculatedWidth = (collectionView.frame.width / UI.CollectionView.column)
      - (UI.CollectionView.inset.left)
      - (UI.CollectionView.itemSpacing / UI.CollectionView.column)

    let calculatedHeight = calculatedWidth + UI.maxTitleHeight + UI.maxSellerHeight + 4

    return CGSize(width: calculatedWidth , height: calculatedHeight)
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

//MARK:- CollectionView decorator

extension ProductListViewController: CollectionViewDecorator {

  func configureCell(collectionView: UICollectionView,
                     indexPath: IndexPath) -> UICollectionViewCell {

    switch ProductListViewModel.CellType(rawValue: indexPath.section) {
    case .product:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseIdentifier,
                                                          for: indexPath) as? ProductCell else {
        return UICollectionViewCell()
      }

      cell.viewModel = ProductCellViewModel(content: viewModel.productList[indexPath.row])

      return cell

    default:
      return UICollectionViewCell()

    }

  }
}
