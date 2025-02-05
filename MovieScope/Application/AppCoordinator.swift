//
//  AppCoordinator.swift
//  MovieScope
//
//  Created by Lena Soroka on 02.02.2025.
//

import UIKit

protocol AppCoordinatorProtocol {
    func start()
}

class AppCoordinator: AppCoordinatorProtocol {
    private var window: UIWindow?
    
    private lazy var rootViewController: UINavigationController = {
        return UINavigationController()
    }()
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        guard let window = window else { return }
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        
        let moviesCoordinator = MoviesCoordinator(rootViewController: rootViewController)
        moviesCoordinator.start()
    }
}
