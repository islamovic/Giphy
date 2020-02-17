//
//  GifCell.swift
//  Giphy
//
//  Created by Islam on 2/16/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import UIKit

class GifCell: UICollectionViewCell {

    @IBOutlet var gifImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    func configure(gif: Gif, completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global().async { [weak self] in
            if let preview = gif.images.preview {
                completion(self?.createImage(url: preview.url))
            } else if let original = gif.images.original {
                completion(self?.createImage(url: original.url))
            }
        }
    }

    func createImage(url: String) -> UIImage? {
        return UIImage.gif(url: url)
    }
}
