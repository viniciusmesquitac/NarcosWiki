//
//  TabBarCoordinator.swift
//  NarcosWiki
//
//  Created by Vinicius Mesquita on 31/10/20.
//
import UIKit

class TabBarCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        // 1. Instanciar a controller
        let tabBarController = TabBarController()
        tabBarController.coordinator = self
        
        // 2. Adicionar as tab`s
        let nav1 = UINavigationController()
        nav1.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        let coordinator1 = CartelsCoordinator(navigationController: nav1)
        
        let nav2 = UINavigationController()
        nav2.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        let coordinator2 = CartelsCoordinator(navigationController: nav2)
        
        // 3. Inserir as tabs na controller
        tabBarController.viewControllers = [nav2, nav1]
        tabBarController.modalPresentationStyle = .fullScreen
       
        // 4. Apresentar a controller
        navigationController.present(tabBarController, animated: true, completion: nil)
        
        // 5. Referencias as coordendadas.
        coordinate(to: coordinator1)
        coordinate(to: coordinator2)
    }

}
