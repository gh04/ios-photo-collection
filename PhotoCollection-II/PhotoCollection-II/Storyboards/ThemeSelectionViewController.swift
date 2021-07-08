//
//  ThemeSelectionViewController.swift
//  PhotoCollection-II
//
//  Created by Gerardo Hernandez on 7/8/21.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    // MARK: - Properties
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func selectDarkThemeButton(_ sender: UIButton) {
    }
    
    @IBAction func selectLightThemeButton(_ sender: UIButton) {
    }
    
    @IBAction func selectBlueThemeButton(_ sender: UIButton) {
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
