//
//  CaracterViewController.swift
//  NarcosWiki
//
//  Created by Vinicius Mesquita on 02/11/20.
//

import UIKit

class CharacterViewController: UITableViewController {

    var viewModel: ListCharactersViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel?.nameOfCartel ?? "Characters"
        self.tableView.separatorStyle = .none
        self.tableView.register(CharactersTableViewCell.self, forCellReuseIdentifier: CharactersTableViewCell.identifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CharactersTableViewCell.identifier) as? CharactersTableViewCell else { return UITableViewCell() }
        if let character = viewModel?.cellViewModel(at: indexPath.row) {
            cell.configure(character: character)
        }
        return cell
    }
    
}
