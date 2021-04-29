Demonstrating how designing complex scrolling page UI can be easy. 

It's like Lego® bricks:
1. create your bricks, for exemple [UserCollectionViewCell.swift](https://github.com/frouo/dynamic-uicollectionview/blob/master/CollectionViewBasedApp/Items/UserCollectionViewCell.swift) + [UserCollectionViewCell.xib](https://github.com/frouo/dynamic-uicollectionview/blob/master/CollectionViewBasedApp/Items/UserCollectionViewCell.xib)
2. reference your bricks in the [`Item`](https://github.com/francoisrouault/dynamic-uicollectionview/blob/master/CollectionViewBasedApp/Item.swift) enum 

And that's it 😃

You are ready to build your design by assembling your own bricks.

Example:

```
class ViewController: UIViewController {
  @IBOutlet weak var collectionView: ItemCollectionView!

  // Here is your design:
  let items: [Item] = [
    .image(source: headerImageUrl),
    .user(profilePictureSource: userImageUrl, username: "John Doe"),
    .collection(items: [
      .user(profilePictureSource: user.father.imageUrl, username: "Korben Dallas"),
      .user(profilePictureSource: user.mother.imageUrl, username: "Lilou Dallas")
    ], scrollDirection: .horizontal),
    .text(user.bio),
    .image(source: footerImageUrl)
  ]

  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.items = items
  }
}
```
