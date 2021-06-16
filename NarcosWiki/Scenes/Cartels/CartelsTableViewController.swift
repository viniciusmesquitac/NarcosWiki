//
//  CartelsViewController.swift
//  NarcosWiki
//
//  Created by Vinicius Mesquita on 31/10/20.
//

import UIKit

class CartelsTableViewController: UITableViewController {
    
    let viewModel = CartelsViewModel()
    var coordinator: CartelsCoordinator?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupNavigationBar()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Narcos Wiki"
        self.tableView.register(CartelsTableViewCell.self,
                                forCellReuseIdentifier: CartelsTableViewCell.identifier)
        self.tableView.rowHeight = 62
        _ = viewModel.getAllCartels()
        
        coordinator = CartelsCoordinator(navigationController: navigationController)
        
        viewModel.handleUpdate = {
            self.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CartelsTableViewCell.identifier) as? CartelsTableViewCell else {
            return UITableViewCell()
        }
        if let cartel = viewModel.cellViewModel(at: indexPath.row) {
            cell.configure(cartel: cartel)
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        coordinator?.showCharacters(characters: viewModel.getListOfCharacters(in: Cartels.allCases[indexPath.row]))
    }

}


// MARK: - Layout
extension CartelsTableViewController {
    func setupNavigationBar() {
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
        UIApplication.shared.statusBarView?.backgroundColor = .red
        UINavigationBar.appearance().tintColor = UIColor.white
        self.navigationController?.navigationBar.barStyle = .black
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.backgroundColor = .red
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = .red
        DispatchQueue.main.async { [weak self] in
            self?.navigationController?.navigationBar.sizeToFit()
        }
    }
}
