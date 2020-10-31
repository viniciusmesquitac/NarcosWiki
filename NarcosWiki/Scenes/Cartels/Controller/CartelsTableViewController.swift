//
//  CartelsViewController.swift
//  NarcosWiki
//
//  Created by Vinicius Mesquita on 31/10/20.
//

import UIKit

class CartelsTableViewController: UITableViewController {

    let viewModel = CartelsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = viewModel.getAllCartels()
        
        viewModel.handleUpdate = {
            self.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCell(withIdentifier: "dequeue_here")
        let cell = UITableViewCell()
        
        if let cellVM = viewModel.cellViewModel(at: indexPath.row) {
            // cell.configure
            cell.textLabel?.text = cellVM.name
        }
        
        return cell
        
    }

}
