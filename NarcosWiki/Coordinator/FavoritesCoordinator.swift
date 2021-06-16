//
//  FavoritesCoordinator.swift
//  NarcosWiki
//
//  Created by Vinicius Mesquita on 16/06/21.
//

import UIKit

final class FavoriteCoordinator: Coordinator {

    var navigationController: UINavigationController!

    init(navigationController: UINavigationController?) {
        guard let navigation = navigationController else { fatalError() }
        self.navigationController = navigation
    }

    func start() {
        let viewController = FavoritesViewController()
        navigationController.pushViewController(viewController, animated: false)
    }
}
