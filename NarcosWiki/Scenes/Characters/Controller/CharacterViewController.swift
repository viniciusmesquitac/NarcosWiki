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
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCell(withIdentifier: "dequeue_here")
        let cell = UITableViewCell()
        
        if let cellVM = viewModel?.cellViewModel(at: indexPath.row) {
            // should be: cell.configure
            cell.textLabel?.text = cellVM.fullName
        }
        return cell
    }
    
}
