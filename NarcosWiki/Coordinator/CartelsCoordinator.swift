//
//  CartelsCoordinator.swift
//  NarcosWiki
//
//  Created by Vinicius Mesquita on 31/10/20.
//

import UIKit

final class CartelsCoordinator: Coordinator {

    var navigationController: UINavigationController!

    init(navigationController: UINavigationController?) {
        guard let navigation = navigationController else { fatalError() }
        self.navigationController = navigation
    }

    func start() {
        let viewController = CartelsTableViewController(style: .grouped)
        navigationController.pushViewController(viewController, animated: false)
    }

    func showCharacters(characters: ListCharactersViewModel) {
        let characterViewController = CharacterViewController(style: .grouped)
        characterViewController.viewModel = characters
        navigationController.pushViewController(characterViewController, animated: true)
    }
}
