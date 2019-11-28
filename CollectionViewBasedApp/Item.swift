//
//  Item.swift
//  CollectionViewBasedApp
//
//  Created by François Rouault on 28/11/2019.
//  Copyright © 2019 Cocorico Studio. All rights reserved.
//

import Foundation
import UIKit

enum Item {
  case user(profilePictureSource: URL, username: String)
  case image(source: URL)
  case collection(items: [Item], scrollDirection: UICollectionView.ScrollDirection)
}

extension Item: ItemProtocol {
  var cellType: CellProtocol.Type {
    switch self {
    case .user:       return UserCollectionViewCell.self
    case .image:      return ImageCollectionViewCell.self
    case .collection: return CollectionViewCollectionViewCell.self
    }
  }
}
