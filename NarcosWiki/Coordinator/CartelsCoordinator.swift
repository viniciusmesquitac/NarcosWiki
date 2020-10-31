//
//  CartelsCoordinator.swift
//  NarcosWiki
//
//  Created by Vinicius Mesquita on 31/10/20.
//

import UIKit

final class CartelsCoordinator: Coordinator {
    
    var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = CartelsTableViewController()
        navigationController.pushViewController(viewController, animated: false)
    }
}
