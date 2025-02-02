//
//  SceneDelegate.swift
//  MovieScope
//
//  Created by Lena Soroka on 01.02.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
    }
}

