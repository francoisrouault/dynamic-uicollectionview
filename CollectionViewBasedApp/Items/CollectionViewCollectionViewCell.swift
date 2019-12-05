//
//  CollectionViewCollectionViewCell.swift
//  CollectionViewBasedApp
//
//  Created by François Rouault on 28/11/2019.
//  Copyright © 2019 Cocorico Studio. All rights reserved.
//

import UIKit

class CollectionViewCollectionViewCell: UICollectionViewCell {

  let flowLayout = UICollectionViewFlowLayout()

  @IBOutlet weak var collectionView: ItemCollectionView!

  var items: [Item]!

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code

    collectionView.collectionViewLayout = flowLayout
  }
}

extension CollectionViewCollectionViewCell: CellProtocol {
  static func size(for item: ItemProtocol, in collectionView: UICollectionView, at indexPath: IndexPath) -> CGSize {
    guard case let Item.collection(innerItems, scrollDirection) = item else { fatalError() }
    switch scrollDirection {
    case .vertical:
      let height = innerItems.reduce(0) { (result, item) -> CGFloat in
        return result + item.cellType.size(for: item, in: collectionView, at: indexPath).height
      }
      return CGSize(width: collectionView.bounds.width, height: height)
    case .horizontal:
      let height: CGFloat = innerItems
        .map { $0.cellType.size(for: item, in: collectionView, at: indexPath).height }
        .sorted()
        .last ?? 0
      return CGSize(width: collectionView.bounds.width, height: height)
    @unknown default:
      return CGSize.zero
    }
  }

  func bind(with item: ItemProtocol) {
    guard case let Item.collection(innerItems, scrollDirection) = item else { fatalError() }

    flowLayout.scrollDirection = scrollDirection

    collectionView.items = innerItems
  }
}
