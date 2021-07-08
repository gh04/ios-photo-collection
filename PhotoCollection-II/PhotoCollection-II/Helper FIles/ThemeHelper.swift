//
//  ThemeHelper.swift
//  PhotoCollection-II
//
//  Created by Gerardo Hernandez on 7/8/21.
//

import Foundation

class ThemeHelper {
    // MARK: - Properties
    var themePreference: String?  {
        let rawValue = UserDefaults.standard.string(forKey: .themePreferenceKey).flatMap(Theme.init) ?? .green
        return rawValue.description
    }
    
    // MARK: - Initializer
    init() {
        if themePreference == nil {
            setThemePreferenceToLight()
        }
    }
    // MARK: - Theme Methods
    func setThemePreferenceToDark() {
        UserDefaults.standard.set(Theme.black.rawValue, forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        UserDefaults.standard.set(Theme.blue.rawValue, forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToLight() {
        UserDefaults.standard.set(Theme.green.rawValue, forKey: .themePreferenceKey)
    }
    
}
// MARK: - Extension
extension String {
    static var themePreferenceKey = "ThemePreference"
}


