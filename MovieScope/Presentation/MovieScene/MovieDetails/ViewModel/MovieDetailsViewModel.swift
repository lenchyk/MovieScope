//
//  MovieDetailsViewModel.swift
//  MovieScope
//
//  Created by Lena Soroka on 02.02.2025.
//

import Foundation

protocol MovieDetailsViewModelProtocol {
    var movieDetailsViewModelActions: MovieDetailsViewModelActions { get }
}

struct MovieDetailsViewModelActions {
    
}

class MovieDetailsViewModel: MovieDetailsViewModelProtocol {
    var movieDetailsViewModelActions: MovieDetailsViewModelActions
    
    init() {
        movieDetailsViewModelActions = .init()
    }
}
