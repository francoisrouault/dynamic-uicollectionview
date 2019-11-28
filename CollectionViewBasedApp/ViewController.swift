//
//  ViewController.swift
//  CollectionViewBasedApp
//
//  Created by François Rouault on 28/11/2019.
//  Copyright © 2019 Cocorico Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var collectionView: UICollectionView!

  let items: [Item] = [
    .image(source: URL(string: "https://dummyimage.com/400x400/ffff00/000000.png&text=image1")!),
    .user(profilePictureSource: URL(string: "https://dummyimage.com/400x400/000/fff.png&text=JD")!, username: "John Dow"),
    .image(source: URL(string: "https://dummyimage.com/400x400/0000f0/fff.png&text=image2")!),
    .collection(items: [
      .user(profilePictureSource: URL(string: "https://dummyimage.com/400x400/000/fff.png&text=JD")!, username: "John Dow ->"),
      .user(profilePictureSource: URL(string: "https://dummyimage.com/400x400/000/fff.png&text=BW")!, username: "Bruce Willis")
    ], scrollDirection: .horizontal),
    .image(source: URL(string: "https://dummyimage.com/400x400/0000f0/fff.png&text=image3")!),
    .collection(items: [
      .image(source: URL(string: "https://dummyimage.com/400x400/f000f/fff.png&text=h")!),
      .image(source: URL(string: "https://dummyimage.com/400x400/f000f/fff.png&text=e")!),
      .image(source: URL(string: "https://dummyimage.com/400x400/f000f/fff.png&text=l")!),
      .image(source: URL(string: "https://dummyimage.com/400x400/f000f/fff.png&text=l")!),
      .image(source: URL(string: "https://dummyimage.com/400x400/f000f/fff.png&text=o")!)
    ], scrollDirection: .horizontal),
    .image(source: URL(string: "https://dummyimage.com/400x400/0000f0/fff.png&text=image4")!),
    .image(source: URL(string: "https://dummyimage.com/400x400/0000f0/fff.png&text=image5")!),
    .collection(items: [
      .user(profilePictureSource: URL(string: "https://dummyimage.com/400x400/000/fff.png&text=JD")!, username: "John Dow"),
      .user(profilePictureSource: URL(string: "https://dummyimage.com/400x400/000/fff.png&text=BW")!, username: "Bruce Willis")
    ], scrollDirection: .vertical),
    .image(source: URL(string: "https://dummyimage.com/400x400/0000f0/fff.png&text=image6")!)
  ]

  override func viewDidLoad() {
    super.viewDidLoad()

    let flowLayout = UICollectionViewFlowLayout()
    collectionView.collectionViewLayout = flowLayout
    collectionView.dataSource = self
    collectionView.delegate = self

    items.forEach { $0.register(in: collectionView) }
  }
}

extension ViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { items.count }

  func numberOfSections(in collectionView: UICollectionView) -> Int { 1 }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let item = items[indexPath.item]
    let cell = item.dequeue(from: collectionView, for: indexPath)
    cell.bind(with: item)
    return cell
  }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
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
