//
//  ItemCollectionView.swift
//  CollectionViewBasedApp
//
//  Created by François Rouault on 28/11/2019.
//  Copyright © 2019 Cocorico Studio. All rights reserved.
//

import UIKit

/// An `UICollectionView` that handles the layout for the given `items`.
///
/// It implements its own `UICollectionViewDataSource` and `UICollectionViewDataSource`.
///
/// Usage:
/// ```
/// itemCollectionView.items = [
///   .user,
///   .hobbies,
///   .logOut
/// ]
/// itemCollectionView.reloadData()
/// ```
///
/// - Important: 💥 Won't work in case `estimatedItemSize` flow layout setting is set to `automatic`. When using Interface Buidler, the default flow layout item estimated size is set to `automatic`. If you want to use the default flow layout in Interface Builder, open Interface Builder, select the collection view, and set "Estimate Size" to `none` in Size Inspector panel.
class ItemCollectionView: UICollectionView {
  var items = [Item]() {
    didSet {
      items.forEach { register($0.nib(), forCellWithReuseIdentifier: $0.reuseIdentifier()) }
    }
  }

  override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
    super.init(frame: frame, collectionViewLayout: layout)
    configure()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    configure()
  }

  private func configure() {
    dataSource = self
    delegate = self
  }
}

extension ItemCollectionView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    print("items count: \(items.count)")
    return items.count
  }

  func numberOfSections(in collectionView: UICollectionView) -> Int { 1 }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let item = items[indexPath.item]

    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: item.reuseIdentifier(), for: indexPath) as? (UICollectionViewCell & CellProtocol) else { fatalError() }

    cell.bind(with: item)

    return cell
  }
}

extension ItemCollectionView: UICollectionViewDelegateFlowLayout {
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
