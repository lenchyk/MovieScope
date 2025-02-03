//
//  MoviesViewModel.swift
//  MovieScope
//
//  Created by Lena Soroka on 02.02.2025.
//

import Foundation

protocol MoviesViewModelProtocol {
    var moviesViewModelActions: MoviesViewModelActions { get set }
}

struct MoviesViewModelActions {
    var reloadMoviesTableView: () -> () = { }
    var showError: (String) -> () = { _ in }
}

class MoviesViewModel: MoviesViewModelProtocol {
    var moviesViewModelActions: MoviesViewModelActions
    
    private var getMoviesUseCase: GetMoviesUseCaseProtocol
    private var movies: [Movie] = []
    private var page: Int = 1
    
    init(getMoviesUseCase: GetMoviesUseCaseProtocol) {
        self.moviesViewModelActions = .init()
        self.getMoviesUseCase = getMoviesUseCase
        
        getMovies()
    }
    
    private func getMovies() {
        getMoviesUseCase.execute(page: page) { [weak self] result in
            switch result {
            case .success(let movies):
                self?.movies.append(contentsOf: movies.movies)
                self?.page = movies.page
                print("Here \(self?.movies)")
                self?.moviesViewModelActions.reloadMoviesTableView()
            case .failure(let error):
                self?.moviesViewModelActions.showError(error.localizedDescription)
            }
        }
    }
}
