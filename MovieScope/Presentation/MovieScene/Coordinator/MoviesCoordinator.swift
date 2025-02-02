//
//  MoviesCoordinator.swift
//  MovieScope
//
//  Created by Lena Soroka on 02.02.2025.
//

import UIKit

class MoviesCoordinator: Coordinator {
    private lazy var moviesViewModel: MoviesViewModelProtocol = {
        let viewModel = MoviesViewModel()
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
}
