//
//  AppConfigurator.swift
//  MovieScope
//
//  Created by Lena Soroka on 03.02.2025.
//

import Foundation

enum AppConfigurator {
    enum Keys: String {
        case accessToken = "ACCESS_TOKEN"
        case baseAPIURL = "BASE_API_URL"
    }

    static func value(for key: Keys) -> String {
        guard let value = Bundle.main.object(forInfoDictionaryKey: key.rawValue) as? String else {
            fatalError(Constants.Error.accessTokenNotFound(key.rawValue))
        }
        return value
    }
}
