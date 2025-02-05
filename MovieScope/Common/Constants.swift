//
//  Constants.swift
//  MovieScope
//
//  Created by Lena Soroka on 02.02.2025.
//

import Foundation

enum Constants {
    enum Common {
        static let ok = "Ok"
    }
    
    enum Error {
        static var universal: (String) -> String = { error in
            return "Error! \(error)!"
        }
        static var accessTokenNotFound: (String) -> String = { key in
            return "Error! Access Token not found by key \(key)!"
        }
        static var savingFailed: (String) -> String = { info in
            return "Error! The error when saving movies! \(info)!"
        }
    }
}
