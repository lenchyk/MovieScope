//
//  MoviesRemote.swift
//  MovieScope
//
//  Created by Lena Soroka on 03.02.2025.
//

import Foundation
import CoreData

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
    
    func toEntity(in context: NSManagedObjectContext) -> MoviesEntity {
        let entity: MoviesEntity = .init(context: context)
        entity.page = Int32(page)
        entity.totalPages = Int16(totalPages)
        movies.forEach {
            entity.addToMovies($0.toEntity(in: context))
        }
        return entity
    }
}
