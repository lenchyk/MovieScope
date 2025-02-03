//
//  MoviesRepositoryProtocol.swift
//  MovieScope
//
//  Created by Lena Soroka on 03.02.2025.
//

import Foundation

protocol MoviesRepositoryProtocol {
    func getMovies(
        page: Int,
        completion: @escaping (Result<Movies, Error>) -> Void
    )
}
