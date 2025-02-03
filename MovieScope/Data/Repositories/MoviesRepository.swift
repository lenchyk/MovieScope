//
//  MoviesRepository.swift
//  MovieScope
//
//  Created by Lena Soroka on 03.02.2025.
//

import Foundation

class MoviesRepository: MoviesRepositoryProtocol {
    func getMovies(
        page: Int,
        completion: @escaping (Result<Movies, Error>) -> Void
    ) {
        let request = URLRequest.request(for: .dailyTrendingMovies(page: page))
        MoviesAPIService.getMovies(request: request) { result in
            switch result {
            case .success(let moviesRemote):
                // should be saving to Core Data here
                completion(.success(moviesRemote.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
