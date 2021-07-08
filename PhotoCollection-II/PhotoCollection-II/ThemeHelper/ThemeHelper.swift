//
//  ThemeHelper.swift
//  PhotoCollection-II
//
//  Created by Gerardo Hernandez on 7/8/21.
//

import Foundation

enum Theme: String, CustomStringConvertible {
    
    var description: String {
        return rawValue
    }
    
    case dark = "Dark"
    case blue = "Blue"
    case light = "Light"
}

class ThemeHelper {
    
    init() {
        if themePreference == nil {
            setThemePreferenceToLight()
        }
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set(Theme.dark.rawValue, forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        UserDefaults.standard.set(Theme.blue.rawValue, forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToLight() {
        UserDefaults.standard.set(Theme.light.rawValue, forKey: .themePreferenceKey)
    }
    
    var themePreference: String?  {
        let rawValue = UserDefaults.standard.string(forKey: .themePreferenceKey).flatMap(Theme.init) ?? .light
        return rawValue.description
    }
}

extension String {
    static var themePreferenceKey = "ThemePreference"
}


