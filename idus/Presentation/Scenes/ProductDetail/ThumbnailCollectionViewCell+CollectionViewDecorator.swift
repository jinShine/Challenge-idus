//
//  ThumbnailCell+CollectionViewDecorator.swift
//  idus
//
//  Created by Seungjin on 06/12/2019.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

//MARK:- CollectionView data source

extension ThumbnailCollectionViewCell: UICollectionViewDataSource {

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    
    return viewModel.numberOfSections()
  }

  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {

    return viewModel.numberOfItemsInSection()
  }

  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    return configureCell(collectionView: collectionView, indexPath: indexPath)
  }

}

//MARK:- CollectionView delegate

extension ThumbnailCollectionViewCell: UICollectionViewDelegate {


}

//MARK:- CollectionView flow layout

extension ThumbnailCollectionViewCell: UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {

    return CGSize(width: collectionView.frame.width, height: collectionView.frame.width)
  }

  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      insetForSectionAt section: Int) -> UIEdgeInsets {

    return .zero
  }

  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

    return .zero
  }

  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {

    return .zero
  }

}

//MARK:- CollectionView decorator

extension ThumbnailCollectionViewCell: CollectionViewDecorator {

  func configureCell(collectionView: UICollectionView,
                     indexPath: IndexPath) -> UICollectionViewCell {

    switch ThumbnailCollectionViewCellViewModel.CellType(rawValue: indexPath.section) {
    case .thumbnail:
      guard let cell = collectionView.dequeueReusableCell(
        withReuseIdentifier: ThumbnailCell.reuseIdentifier, for: indexPath) as? ThumbnailCell else {
        return UICollectionViewCell()
      }
      cell.viewModel = ThumbnailCellViewModel(thumbnail: viewModel.thumbnailList[indexPath.item])

      return cell

    default:
      return UICollectionViewCell()

    }

  }
}



//MARK: - ScrollView delegate

extension ThumbnailCollectionViewCell: UIScrollViewDelegate {
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    progressView.progress = Float((scrollView.contentOffset.x / thumbnailCollectionView.frame.width) + 1) / Float(viewModel.thumbnailList.count)
  }
}
