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
  func register(in collectionView: UICollectionView)
  func dequeue(from collectionView: UICollectionView, for indexPath: IndexPath) -> UICollectionViewCell & CellProtocol
}

// MARK: Default implementation

extension ItemProtocol {
  func register(in collectionView: UICollectionView) {
    collectionView.register(nib(), forCellWithReuseIdentifier: identifier())
  }

  func dequeue(from collectionView: UICollectionView, for indexPath: IndexPath) -> UICollectionViewCell & CellProtocol {
    return collectionView.dequeueReusableCell(withReuseIdentifier: identifier(), for: indexPath) as! (UICollectionViewCell & CellProtocol)
  }

  private func nib() -> UINib {
    UINib(nibName: "\(cellType)", bundle: nil)
  }

  private func identifier() -> String {
    String(describing: cellType)
  }
}
