//
//  Endpoint.swift
//  MovieScope
//
//  Created by Lena Soroka on 03.02.2025.
//

import Foundation

enum Endpoint: RawRepresentable {
    typealias RawValue = String
    case dailyTrendingMovies(page: Int)
    
    init?(rawValue: String) {
        fatalError(APIError.invalidURL.localizedDescription)
    }
    
    var rawValue: String {
        switch self {
        case .dailyTrendingMovies(let page):
            return "/3/trending/movie/day?page=\(page)"
        }
    }
}
