//
//  MoviesRemote.swift
//  MovieScope
//
//  Created by Lena Soroka on 03.02.2025.
//

import Foundation

struct MoviesRemote: Decodable {
    private enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case movies = "results"
    }
    let page: Int
    let totalPages: Int
    let movies: [MovieRemote]
}

extension MoviesRemote {
    func toDomain() -> Movies {
        return .init(
            page: page,
            totalPages: totalPages,
            movies: movies.map { $0.toDomain() }
        )
    }
}
