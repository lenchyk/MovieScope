//
//  MovieDetailsViewModel.swift
//  MovieScope
//
//  Created by Lena Soroka on 02.02.2025.
//

import Foundation

protocol MovieDetailsViewModelProtocol {
    var movie: Movie { get }
}

class MovieDetailsViewModel: MovieDetailsViewModelProtocol {
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
