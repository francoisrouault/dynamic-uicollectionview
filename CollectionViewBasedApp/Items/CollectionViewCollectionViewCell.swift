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

  @IBOutlet weak var collectionView: UICollectionView!

  var items: [Item]!

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code

    collectionView.collectionViewLayout = flowLayout
    collectionView.dataSource = self
    collectionView.delegate = self
  }
}

extension CollectionViewCollectionViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { items.count }

  func numberOfSections(in collectionView: UICollectionView) -> Int { 1 }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let item = items[indexPath.item]
    let cell = item.dequeue(from: collectionView, for: indexPath)
    cell.bind(with: item)
    return cell
  }
}

extension CollectionViewCollectionViewCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let item = items[indexPath.item]
    return item.cellType.size(for: item, in: collectionView, at: indexPath)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
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

    items = innerItems
    items.forEach { $0.register(in: collectionView) }
    flowLayout.scrollDirection = scrollDirection
    collectionView.reloadData()
  }
}
