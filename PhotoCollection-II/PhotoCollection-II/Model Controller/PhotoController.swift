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
    
    init() {
        loadFromPersistentStore()
    }
    
    // MARK: - CRUD Methods
     func create(photo imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
        saveToPersistentStore()
    }
     func update(photo: Photo, imageData: Data, title: String) {
        // Getting the first instance of the photo we pass in
        guard let index = photos.firstIndex(of: photo) else { return }
        
        let updatedPhoto = Photo(imageData: imageData, title: title)
        // Assiging the updated photo into our array of photos
        photos[index] = updatedPhoto
        saveToPersistentStore()
    }
    // MARK: - Persistence
    private var photoCollectionURL: URL? {
        let fm = FileManager.default
        
        guard let documentsDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        let photosURL = documentsDir.appendingPathComponent("photos.plist")
        return photosURL
    }
    
    private func saveToPersistentStore() {
        guard let url = photoCollectionURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let photosPlist = try encoder.encode(photos)
            try photosPlist.write(to: url)
        } catch {
            print("Error saving photos data: \(error)")
        }
    }
    
    private func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = photoCollectionURL, fm.fileExists(atPath: url.path) else { return }
        
        do {
            let photosPlist = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            photos = try decoder.decode([Photo].self, from: photosPlist)
        } catch {
            print("Error loading photos date: \(error)")
        }
    }
}
