//
//  ImageLoader.swift
//  CollectionViewBasedApp
//
//  Created by François Rouault on 28/11/2019.
//  Copyright © 2019 Cocorico Studio. All rights reserved.
//

import Foundation
import UIKit

func loadImage(source: URL, completion: @escaping (UIImage) -> Void) {
  DispatchQueue.global(qos: .userInteractive).async {
    guard
      let data = try? Data(contentsOf: source),
      let image = UIImage(data: data)
      else { return }
    DispatchQueue.main.async {
      completion(image)
    }
  }
}
