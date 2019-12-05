//
//  TableViewDecorator.swift
//  idus
//
//  Created by seungjin on 2019/12/06.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Foundation
import UIKit

protocol TableViewViewDecorator {

  func configureCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
}

