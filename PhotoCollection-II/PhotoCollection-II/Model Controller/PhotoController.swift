//
//  PhotoController.swift
//  PhotoCollection-II
//
//  Created by Gerardo Hernandez on 7/8/21.
//

import Foundation

class PhotoController {
    // MARK: - Properties
    var photos = [Photo]()
    
    // MARK: - CRUD Methods
    private func create(photo imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    private func update(photo: Photo, imageData: Data, title: String) {
        
    }
}
