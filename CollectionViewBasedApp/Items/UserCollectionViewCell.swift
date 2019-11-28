//
//  UserCollectionViewCell.swift
//  CollectionViewBasedApp
//
//  Created by François Rouault on 28/11/2019.
//  Copyright © 2019 Cocorico Studio. All rights reserved.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var profilePictureImageView: UIImageView!
  @IBOutlet weak var usernameLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
}

extension UserCollectionViewCell: CellProtocol {
  static func size(for item: ItemProtocol, in collectionView: UICollectionView, at indexPath: IndexPath) -> CGSize {
    CGSize(width: collectionView.bounds.width, height: 100)
  }

  func bind(with item: ItemProtocol) {
    guard case let Item.user(profilePictureSource, username) = item else { fatalError() }

    usernameLabel.text = username
    loadImage(source: profilePictureSource) { [weak imageView = profilePictureImageView] image in
      imageView?.image = image
    }
  }
}
