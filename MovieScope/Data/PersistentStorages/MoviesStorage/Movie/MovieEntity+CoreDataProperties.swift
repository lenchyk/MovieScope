//
//  MovieEntity+CoreDataProperties.swift
//  MovieScope
//
//  Created by Lena Soroka on 05.02.2025.
//
//

import Foundation
import CoreData


extension MovieEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieEntity> {
        return NSFetchRequest<MovieEntity>(entityName: "MovieEntity")
    }

    @NSManaged public var id: Int64
    @NSManaged public var mediaType: String?
    @NSManaged public var overview: String?
    @NSManaged public var poster: String?
    @NSManaged public var title: String?
    @NSManaged public var voteAverage: Double
    @NSManaged public var moviesEntity: MoviesEntity?

}

extension MovieEntity : Identifiable {

}
