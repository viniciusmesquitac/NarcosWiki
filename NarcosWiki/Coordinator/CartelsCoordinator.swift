//
//  CartelsCoordinator.swift
//  NarcosWiki
//
//  Created by Vinicius Mesquita on 31/10/20.
//

import UIKit

protocol CartelsCoordinatorProtocol: Coordinator {
    func showCharacters(characters: ListCharactersViewModel)
    func showCharacterDetails()
}

class CartelsCoordinator: CartelsCoordinatorProtocol {

    var navigationController: UINavigationController!

    init(navigationController: UINavigationController?) {
        guard let navigation = navigationController else { fatalError() }
        self.navigationController = navigation
    }

    func start() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        let viewController = CartelsTableViewController(style: .grouped)
        navigationController?.pushViewController(viewController, animated: false)
    }

    func showCharacters(characters: ListCharactersViewModel) {
        let characterViewController = CharacterViewController(viewModel: characters, coordinator: self)
        navigationController?.pushViewController(characterViewController, animated: true)
    }
    
    func showCharacterDetails() {
        let detailsVC = CharacterDetailsViewController(coordinator: self)
        let nav = UINavigationController(rootViewController: detailsVC)
        navigationController?.present(nav, animated: true)
    }
}
