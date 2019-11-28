//
//  ImageCollectionViewCell.swift
//  CollectionViewBasedApp
//
//  Created by François Rouault on 28/11/2019.
//  Copyright © 2019 Cocorico Studio. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var imageView: UIImageView!

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
}

extension ImageCollectionViewCell: CellProtocol {
  static func size(for item: ItemProtocol, in collectionView: UICollectionView, at indexPath: IndexPath) -> CGSize {
    CGSize(width: collectionView.bounds.width, height: 200)
  }

  func bind(with item: ItemProtocol) {
    guard case let Item.image(source) = item else { fatalError() }

    loadImage(source: source) { [weak imageView = imageView] image in
      imageView?.image = image
    }
  }
}
