//
//  PhotosCollectionViewController.swift
//  PhotoCollection-II
//
//  Created by Gerardo Hernandez on 7/8/21.
//

import UIKit


class PhotosCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    let photoContoller = PhotoController()
    let themeHelper = ThemeHelper()


    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
        setTheme()
    }
    // MARK: - Method
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { fatalError("Cell is not a PhotosCollectionViewCell")}
        
        let photo = photoContoller.photos[indexPath.row]
        cell.photo = photo
    
        return cell
    }

}
