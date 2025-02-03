//
//  GetMoviesUseCase.swift
//  MovieScope
//
//  Created by Lena Soroka on 03.02.2025.
//

import Foundation

protocol GetMoviesUseCaseProtocol {
    func execute(page: Int, completion: @escaping (Result<Movies, Error>) -> Void)
}

class GetMoviesUseCase: GetMoviesUseCaseProtocol {
    private let moviesRepository: MoviesRepositoryProtocol

    init(moviesRepository: MoviesRepositoryProtocol) {
        self.moviesRepository = moviesRepository
    }

    func execute(
        page: Int,
        completion: @escaping (Result<Movies, Error>) -> Void
    ) {
        moviesRepository.getMovies(page: page) { result in
            completion(result)
        }
    }
}
