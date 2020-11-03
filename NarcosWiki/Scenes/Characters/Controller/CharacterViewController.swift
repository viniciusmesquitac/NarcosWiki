//
//  CaracterViewController.swift
//  NarcosWiki
//
//  Created by Vinicius Mesquita on 02/11/20.
//

import UIKit

class CharacterViewController: UITableViewController {
    
    var viewModel: [Character]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .blue
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCell(withIdentifier: "dequeue_here")
        let cell = UITableViewCell()
        
//        if let cellVM = viewModel.cellViewModel(at: indexPath.row) {
//            // cell.configure
//            cell.textLabel?.text = cellVM.name
//        }
//        
        return cell
    }

}
