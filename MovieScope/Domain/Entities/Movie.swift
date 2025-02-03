//
//  Movie.swift
//  MovieScope
//
//  Created by Lena Soroka on 02.02.2025.
//

import Foundation

struct Movie {
    enum MediaType {
        case movie
        case tv
        case person
    }
    let id: Int
    var title: String
    var overview: String
    var poster: String
    var voteAverage: Double
    var mediaType: MediaType
}
