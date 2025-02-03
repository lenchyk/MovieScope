//
//  MoviesAPIService.swift
//  MovieScope
//
//  Created by Lena Soroka on 03.02.2025.
//

import Foundation

class MoviesAPIService: BaseAPIService {
    static func getMovies(
        request: URLRequest,
        completion: @escaping (Result<MoviesRemote, Error>) -> Void
    ) {
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                completion(.failure(error))
                return
            }
            guard let data, let response else {
                completion(.failure(APIError.emptyData))
                return
            }
            
            do {
                let movies = try JSONDecoder().decode(MoviesRemote.self, from: validate(data, response))
                completion(.success(movies))
            }
            catch {
                completion(.failure(APIError.invalidJSON))
            }
        }
        task.resume()
    }
}
