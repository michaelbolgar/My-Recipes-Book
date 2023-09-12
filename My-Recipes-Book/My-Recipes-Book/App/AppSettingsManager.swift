//
//  AppSettingsManager.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 10.09.2023.
//

import Foundation

struct AppSettingsManager {

    static let onboardingCompletedKey = "OnboardingCompleted"

    static func setOnboardingCompleted(_ completed: Bool) {
        UserDefaults.standard.set(completed, forKey: onboardingCompletedKey)
    }

    static func isOnboardingCompleted() -> Bool {
           UserDefaults.standard.bool(forKey: onboardingCompletedKey)
   }
}
