//
//  MoviesEntity+CoreDataProperties.swift
//  MovieScope
//
//  Created by Lena Soroka on 05.02.2025.
//
//

import Foundation
import CoreData


extension MoviesEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MoviesEntity> {
        return NSFetchRequest<MoviesEntity>(entityName: "MoviesEntity")
    }

    @NSManaged public var page: Int32
    @NSManaged public var totalPages: Int16
    @NSManaged public var movies: NSSet?

}

// MARK: Generated accessors for movies
extension MoviesEntity {

    @objc(addMoviesObject:)
    @NSManaged public func addToMovies(_ value: MovieEntity)

    @objc(removeMoviesObject:)
    @NSManaged public func removeFromMovies(_ value: MovieEntity)

    @objc(addMovies:)
    @NSManaged public func addToMovies(_ values: NSSet)

    @objc(removeMovies:)
    @NSManaged public func removeFromMovies(_ values: NSSet)

}

extension MoviesEntity : Identifiable {

}
