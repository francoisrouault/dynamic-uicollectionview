//
//  Cell+Protocol.swift
//  CollectionViewBasedApp
//
//  Created by François Rouault on 28/11/2019.
//  Copyright © 2019 Cocorico Studio. All rights reserved.
//

import Foundation
import UIKit

protocol CellProtocol {
  static func size(for item: ItemProtocol, in collectionView: UICollectionView, at indexPath: IndexPath) -> CGSize

  func bind(with item: ItemProtocol)
}
