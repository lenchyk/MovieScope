//
//  MoviesViewModel.swift
//  MovieScope
//
//  Created by Lena Soroka on 02.02.2025.
//

import Foundation

protocol MoviesViewModelProtocol {
    var moviesViewModelActions: MoviesViewModelActions { get }
}

struct MoviesViewModelActions {
    
}

class MoviesViewModel: MoviesViewModelProtocol {
    var moviesViewModelActions: MoviesViewModelActions
    
    init() {
        moviesViewModelActions = .init()
    }
}
