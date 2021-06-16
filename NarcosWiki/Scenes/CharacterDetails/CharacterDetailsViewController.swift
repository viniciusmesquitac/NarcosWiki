//
//  CharacterDetailsViewController.swift
//  NarcosWiki
//
//  Created by Vinicius Mesquita on 10/06/21.
//

import UIKit

class CharacterDetailsViewController: UIViewController {

    var coordinator: CartelsCoordinator?

    override func loadView() {
        self.view = CharacterDetailsView()
    }

    init(coordinator: CartelsCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
