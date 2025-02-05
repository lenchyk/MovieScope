//
//  MoviesStorage.swift
//  MovieScope
//
//  Created by Lena Soroka on 05.02.2025.
//

import Foundation

protocol MoviesStorageServiceProtocol {
    func fetch(completion: @escaping (Result<MoviesRemote?, Error>) -> Void)
    func save(movies: MoviesRemote)
}

class MoviesStorageService: MoviesStorageServiceProtocol {
    private let coreDataStorage: CoreDataStorageService = CoreDataStorageService.shared

    func fetch(completion: @escaping (Result<MoviesRemote?, Error>) -> Void) {
        coreDataStorage.performBackgroundTask { context in
            do {
                let request = MoviesEntity.fetchRequest()
                let moviesEntities = try context.fetch(request).first
                
                completion(.success(moviesEntities?.toRemote()))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func save(movies: MoviesRemote) {
        coreDataStorage.performBackgroundTask { context in
            do {
                let requestEntity = movies.toEntity(in: context)
                try context.save()
            } catch {
                debugPrint("CoreDataMoviesResponseStorage Unresolved error \(error), \((error as NSError).userInfo)")
            }
        }
    }
}
