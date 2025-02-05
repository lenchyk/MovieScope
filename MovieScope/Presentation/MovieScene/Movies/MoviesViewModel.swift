//
//  MoviesViewModel.swift
//  MovieScope
//
//  Created by Lena Soroka on 02.02.2025.
//

import Foundation

protocol MoviesViewModelProtocol {
    var movies: [Movie] { get }
    var moviesViewModelActions: MoviesViewModelActions { get set }
    func goToMovieDetails(_ movie: Movie)
}

struct MoviesViewModelActions {
    var reloadMoviesTableView: () -> () = { }
    var showError: (String) -> () = { _ in }
}

class MoviesViewModel: MoviesViewModelProtocol {
    var moviesViewModelActions: MoviesViewModelActions
    
    private var getMoviesUseCase: GetMoviesUseCaseProtocol
    private var coordinator: MoviesCoordinatorProtocol
    private(set) var movies: [Movie] = []
    private var page: Int = 1
    
    init(
        getMoviesUseCase: GetMoviesUseCaseProtocol,
        coordinator: MoviesCoordinatorProtocol
    ) {
        self.moviesViewModelActions = .init()
        self.getMoviesUseCase = getMoviesUseCase
        self.coordinator = coordinator
        
        getMovies()
    }
    
    private func getMovies() {
        getMoviesUseCase.execute(page: page) { [weak self] result in
            switch result {
            case .success(let movies):
                self?.movies.append(contentsOf: movies.movies)
                self?.page = movies.page
                self?.moviesViewModelActions.reloadMoviesTableView()
            case .failure(let error):
                self?.moviesViewModelActions.showError(error.localizedDescription)
            }
        }
    }
    
    func goToMovieDetails(_ movie: Movie) {
        coordinator.showMovieDetails(movie)
    }
}
