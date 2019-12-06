//
//  ThumbnailCellViewModel.swift
//  idus
//
//  Created by seungjin on 2019/12/06.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

class ThumbnailCollectionViewCellViewModel {

  //MARK:- Cell Type

  enum CellType: Int {
    case thumbnail
  }


  //MARK: Properties

  let thumbnailList: [String]


  //MARK:- Init

  init(thumbnailList: [String]) {
    self.thumbnailList = thumbnailList
  }


  //MARK: - data source

  func numberOfSections() -> Int {
    return 1
  }

  func numberOfItemsInSection() -> Int {
    return thumbnailList.count
  }

}
