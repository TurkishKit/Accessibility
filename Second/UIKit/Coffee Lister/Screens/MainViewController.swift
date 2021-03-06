//
//  MainViewController.swift
//  Coffee Lister
//
//  Created by Can Balkaya on 1/25/21.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - UI Elements
    lazy var tableView = UITableView()
    
    // MARK: - Properties
    let coffees = Coffee.coffees
    var dataStore = DataStore.shared
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureTableView()
    }
    
    // MARK: - Functions
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Coffees"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(CoffeeCell.self, forCellReuseIdentifier: CoffeeCell.reuseID)
    }
    
    // MARK: - TableView Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStore.getAllCoffees().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CoffeeCell.reuseID) as! CoffeeCell
        let coffee = coffees[indexPath.row]
        
        cell.set(coffee: coffee)
        
        return cell
    }
    
    // MARK: - TableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let coffee = coffees[indexPath.row]
        let detailVC = DetailViewController(coffee: coffee)
        let navigationController = UINavigationController(rootViewController: detailVC)
        present(navigationController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "Delete") { [weak self] (action, view, completionHandler) in
//            self!.dataStore.delete(coffee: self!.coffees[indexPath.row])
            completionHandler(true)
        }
        action.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [action])
    }
}
