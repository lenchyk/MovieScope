//
//  MoviesCoordinator.swift
//  MovieScope
//
//  Created by Lena Soroka on 02.02.2025.
//

import UIKit

protocol MoviesCoordinatorProtocol {
    func start()
    func showMovieDetails(_ movie: Movie)
}

class MoviesCoordinator: MoviesCoordinatorProtocol {
    private lazy var moviesViewModel: MoviesViewModelProtocol = {
        let moviesRepo = MoviesRepository()
        let getMoviesUseCase = GetMoviesUseCase(moviesRepository: moviesRepo)
        let viewModel = MoviesViewModel(
            getMoviesUseCase: getMoviesUseCase,
            coordinator: self
        )
        return viewModel
    }()
    
    private let rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    func start() {
        let moviesViewController = MoviesViewController()
        moviesViewController.viewModel = moviesViewModel
        rootViewController.pushViewController(moviesViewController, animated: true)
    }
    
    func showMovieDetails(_ movie: Movie) {
        let moviesDetailsVC = MovieDetailsViewController()
        moviesDetailsVC.viewModel = MovieDetailsViewModel(movie: movie)
        rootViewController.pushViewController(moviesDetailsVC, animated: true)
    }
}
