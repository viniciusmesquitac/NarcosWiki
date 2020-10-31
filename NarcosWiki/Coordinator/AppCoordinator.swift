//
//  AppCoordinator.swift
//  NarcosWiki
//
//  Created by Vinicius Mesquita on 31/10/20.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    private let navigationController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start() {
        window.rootViewController = self.navigationController
        window.makeKeyAndVisible()
        cordinateToTabBar()
    }
    
    private func cordinateToTabBar() {
        let tabBarCordinator = TabBarCoordinator(navigationController: navigationController)
        coordinate(to: tabBarCordinator)
    }
    
}
