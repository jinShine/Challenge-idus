//
//  CollectionViewDecorator.swift
//  idus
//
//  Created by Seungjin on 03/12/2019.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Foundation
import UIKit

protocol CollectionViewDecorator {

  func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
}

