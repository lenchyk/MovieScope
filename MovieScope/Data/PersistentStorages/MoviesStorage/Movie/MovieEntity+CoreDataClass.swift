//
//  MovieEntity+CoreDataClass.swift
//  MovieScope
//
//  Created by Lena Soroka on 05.02.2025.
//
//

import Foundation
import CoreData

@objc(MovieEntity)
public class MovieEntity: NSManagedObject {
    func toRemote() -> MovieRemote {
        .init(
            id: Int(id),
            title: title,
            overview: overview,
            posterPath: poster,
            voteAverage: voteAverage,
            mediaType: .init(rawValue: mediaType ?? "")
        )
    }
}
