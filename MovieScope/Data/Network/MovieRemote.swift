//
//  MovieRemote.swift
//  MovieScope
//
//  Created by Lena Soroka on 03.02.2025.
//

struct MovieRemote: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case mediaType = "media_type"
    }
    
    enum MediaTypeRemote: String, Decodable {
        case movie
        case tv
        case person
        
        func toDomain() -> Movie.MediaType {
            switch self {
            case .movie: return .movie
            case .tv: return .tv
            case .person: return .person
            }
        }
    }
    
    let id: Int
    let title: String?
    let overview: String?
    let posterPath: String?
    let voteAverage: Double?
    let mediaType: MediaTypeRemote?
    
    func toDomain() -> Movie {
        .init(
            id: id,
            title: title ?? "",
            overview: overview ?? "",
            poster: posterPath ?? "",
            voteAverage: voteAverage ?? 0,
            mediaType: mediaType?.toDomain() ?? .movie
        )
    }
}
