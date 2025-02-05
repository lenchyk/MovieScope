//
//  MoviesEntity+CoreDataClass.swift
//  MovieScope
//
//  Created by Lena Soroka on 05.02.2025.
//
//

import Foundation
import CoreData

@objc(MoviesEntity)
public class MoviesEntity: NSManagedObject {
    func toRemote() -> MoviesRemote {
        .init(
            page: Int(page),
            totalPages: Int(totalPages),
            movies: movies?.allObjects.map { ($0 as! MovieEntity).toRemote() } ?? []
        )
    }
}
