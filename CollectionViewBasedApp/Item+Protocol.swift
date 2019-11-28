//
//  Item+Cell.swift
//  CollectionViewBasedApp
//
//  Created by François Rouault on 28/11/2019.
//  Copyright © 2019 Cocorico Studio. All rights reserved.
//

import UIKit

protocol ItemProtocol {
  var cellType: CellProtocol.Type { get }
  func nib() -> UINib
  func reuseIdentifier() -> String
}

// MARK: Default implementation

extension ItemProtocol {
  func nib() -> UINib {
    UINib(nibName: "\(cellType)", bundle: nil)
  }

  func reuseIdentifier() -> String {
    String(describing: cellType)
  }
}
