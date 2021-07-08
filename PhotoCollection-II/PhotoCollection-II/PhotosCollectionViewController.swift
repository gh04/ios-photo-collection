//
//  PhotosCollectionViewController.swift
//  PhotoCollection-II
//
//  Created by Gerardo Hernandez on 7/8/21.
//

import UIKit


class PhotosCollectionViewController: UICollectionViewController {
    
    let photoContoller = PhotoController()
    let themeHelper = ThemeHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func setTheme() {
        guard let currentTheme = themeHelper.themePreference else { return }
        self.collectionView.backgroundColor = UIColor.colorWith(name: currentTheme)
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "PhotoDetailShowSegue":
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController, let indexPath = sender as? NSIndexPath else { return }
            let photo = photoContoller.photos[indexPath.row]
            photoDetailVC.photo = photo
            photoDetailVC.photoController = photoContoller
            photoDetailVC.themeHelper = themeHelper
        case "AddPhotoShowSegue":
            guard let addPhotoVC = segue.destination as? PhotoDetailViewController else { return }
            addPhotoVC.themeHelper = themeHelper
            addPhotoVC.photoController = photoContoller
        case "SelectThemeModalSegue":
            guard let themeVC = segue.destination as? ThemeSelectionViewController else { return }
            themeVC.themeHelper = themeHelper
        default:
            return
        }
    }
    

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        return photoContoller.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanetCell", for: indexPath) as? PhotosCollectionViewCell else { fatalError("Cell is not a PhotosCollectionViewCell")}
        
        let photo = photoContoller.photos[indexPath.row]
        cell.photo = photo
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

extension UIColor {

    static func colorWith(name:String) -> UIColor? {
        let selector = Selector("\(name)Color")
        if UIColor.self.responds(to: selector) {
            let color = UIColor.self.perform(selector).takeUnretainedValue()
            return (color as? UIColor)
        } else {
            return nil
        }
    }
}
