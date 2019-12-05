//
//  ViewController.swift
//  CollectionViewBasedApp
//
//  Created by François Rouault on 28/11/2019.
//  Copyright © 2019 Cocorico Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var collectionView: ItemCollectionView!

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

    collectionView.items = items
  }
}
