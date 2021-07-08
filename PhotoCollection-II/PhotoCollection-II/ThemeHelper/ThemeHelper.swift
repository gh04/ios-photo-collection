//
//  ThemeHelper.swift
//  PhotoCollection-II
//
//  Created by Gerardo Hernandez on 7/8/21.
//

import Foundation
// MARK: - Theme
enum Theme: String, CustomStringConvertible {
    case dark = "Dark"
    case blue = "Blue"
    case light = "Light"
    
    var description: String {
        return rawValue
    }
}

class ThemeHelper {
    
    // MARK: - Properties
    var themePreference: String?  {
        let rawValue = UserDefaults.standard.string(forKey: .themePreferenceKey).flatMap(Theme.init) ?? .light
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
        UserDefaults.standard.set(Theme.dark.rawValue, forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        UserDefaults.standard.set(Theme.blue.rawValue, forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToLight() {
        UserDefaults.standard.set(Theme.light.rawValue, forKey: .themePreferenceKey)
    }
    
}
// MARK: - Extension
extension String {
    static var themePreferenceKey = "ThemePreference"
}


