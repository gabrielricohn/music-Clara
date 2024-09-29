//
//  AppConfigurationManager.swift
//  MusicAppClara
//
//  Created by Gabriel Rico on 28/9/24.
//

import Foundation

// MARK: - App Configuration Manager Type
protocol AppConfigurationManagerType {
    func getAppConfiguration(with name: AppConfigurationNames) -> String?
}

// MARK: - AppConfiguration Manager
class AppConfigurationManager: AppConfigurationManagerType {
    // MARK: - Shared Instance
    static let shared: AppConfigurationManagerType = AppConfigurationManager()
    
    // MARK: - Functionality
    func getAppConfiguration(with name: AppConfigurationNames) -> String? {
        Bundle.main.object(forInfoDictionaryKey: name.rawValue) as? String
    }
}

// MARK: - App Configuration Names
enum AppConfigurationNames: String {
    case discogsApiKey = "MUSIC_API_KEY"
    case baseURL = "API_BASE_URL"
    case imagesURL = "IMAGES_BASE_URL"
    case readToken = "MUSIC_READ_TOKEN"
}
