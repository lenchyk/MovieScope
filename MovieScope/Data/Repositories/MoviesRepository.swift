//
//  MoviesRepository.swift
//  MovieScope
//
//  Created by Lena Soroka on 03.02.2025.
//

import Foundation

class MoviesRepository: MoviesRepositoryProtocol {
    
    private var moviesStorageService: MoviesStorageServiceProtocol
    
    init(moviesStorageService: MoviesStorageServiceProtocol) {
        self.moviesStorageService = moviesStorageService
    }
    
    func getMovies(
        page: Int,
        completion: @escaping (Result<Movies, Error>) -> Void
    ) {
        fetchLocalMovies(completion: completion)
        let request = URLRequest.request(for: .dailyTrendingMovies(page: page))
        MoviesAPIService.getMovies(request: request) { [weak self] result in
            switch result {
            case .success(let moviesRemote):
                self?.moviesStorageService.save(movies: moviesRemote)
                completion(.success(moviesRemote.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
    
    private func fetchLocalMovies(completion: @escaping (Result<Movies, Error>) -> Void) {
        self.moviesStorageService.fetch { result in
            switch result {
            case .success(let moviesRemote):
                guard let movies = moviesRemote?.toDomain() else { return }
                completion(.success(movies))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
