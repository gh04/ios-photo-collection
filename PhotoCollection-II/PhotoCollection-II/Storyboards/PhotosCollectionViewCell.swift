//
//  PhotosCollectionViewCell.swift
//  PhotoCollection-II
//
//  Created by Gerardo Hernandez on 7/8/21.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    // MARK: Properties
     var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    
private func updateViews() {
    guard let photo = photo else { return }
    
    imageView.image = UIImage(data: photo.imageData)?.flattened
    label.text = photo.title

    }
}
