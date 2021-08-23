//
//  CaracterViewController.swift
//  NarcosWiki
//
//  Created by Vinicius Mesquita on 02/11/20.
//

import UIKit

class CharacterViewController: UITableViewController {

    var viewModel: ListCharactersViewModel?
    var coordinator: CartelsCoordinator?

    init(viewModel: ListCharactersViewModel, coordinator: CartelsCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.coordinator = coordinator
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel?.nameOfCartel ?? "Characters"
        self.tableView.separatorStyle = .none
        self.tableView.register(CharactersTableViewCell.self, forCellReuseIdentifier: CharactersTableViewCell.identifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows ?? 0
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CharactersTableViewCell.identifier) as? CharactersTableViewCell else { return UITableViewCell() }
        if let character = viewModel?.cellViewModel(at: indexPath.row) {
            cell.configure(character: character)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        coordinator?.showCharacterDetails()
    }
    
}
