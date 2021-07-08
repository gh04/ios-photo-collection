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
     func create(photo imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
     func update(photo: Photo, imageData: Data, title: String) {
        // Getting the first instance of the photo we pass in
        guard let index = photos.firstIndex(of: photo) else { return }
        
        let updatedPhoto = Photo(imageData: imageData, title: title)
        // Assiging the updated photo into our array of photos
        photos[index] = updatedPhoto
    }
}
