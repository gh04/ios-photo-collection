//
//  PhotoDetailViewController.swift
//  PhotoCollection-II
//
//  Created by Gerardo Hernandez on 7/8/21.
//

import UIKit



class PhotoDetailViewController: UIViewController {
    
    // MARK: - Properties
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        setTheme()
        updateViews()
    }
    
    // MARK: - Methods
    private func setTheme() {
        guard let currentTheme = themeHelper?.themePreference else { return }
        view.backgroundColor = UIColor.colorWith(name: currentTheme)
    }
    
    private func updateViews() {
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)?.flattened
        textField.text = photo.title
    }
    
    // MARK: - Actions
    @IBAction func addPhoto(_ sender: UIButton) {
        let alert = UIAlertController(title: "Photo Collection would like to\naccess your photo library", message: nil, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel, handler: { action in self.present(self.imagePicker, animated: true, completion: nil)})
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
        
        
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        
        if let title = textField.text,
                    let image = imageView.image?.pngData() {
                    if let photo = photo {
                        photoController?.update(photo: photo, imageData: image, title: title)
                        navigationController?.popViewController(animated: true)
                    } else {
                        photoController?.create(photo: image, title: title)
                        navigationController?.popViewController(animated: true)
                    }
                } else {
                    let alert = UIAlertController(title: "Please add a photo and title", message: nil, preferredStyle: .alert)
                    let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(okButton)
                    present(alert, animated: true, completion: nil)
                }
            }
}

extension PhotoDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        imageView.image = image
        picker.dismiss(animated: true, completion: nil)
    
    }
}
