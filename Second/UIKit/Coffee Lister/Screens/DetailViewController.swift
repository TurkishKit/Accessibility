//
//  DetailViewController.swift
//  Coffee Lister
//
//  Created by Can Balkaya on 1/28/21.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UI Elements
    lazy var coffeeImageView = CoffeeImageView(frame: .zero)
    lazy var coffeeTitleLabel = CoffeeTitleLabel(textAlignment: .center, fontSize: 30)
    lazy var coffeeDescriptionLabel = GFBodyLabel(textAlignment: .center)
    lazy var favoriteButton = FavoriteButton()
    lazy var tableView = UITableView()
    
    // MARK: - Properties
    var coffee: Coffee!
    private var instructionViewModel = InstructionViewModel()
    let options = ["Whole Earth® Stevia w/ Monk Fruit", "Vanilla Sweet Cream Cold Foam", "Sugar Free Cinnamon Dolce Syrup"]
    
    // MARK: - Life Cycle
    init(coffee: Coffee) {
        super.init(nibName: nil, bundle: nil)
        
        self.coffee = coffee
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        addViews()
        configureViews()
        layoutUI()
    }
    
    // MARK: - Functions
    func addViews() {
        view.addSubview(tableView)
        view.addSubview(coffeeImageView)
        view.addSubview(coffeeTitleLabel)
        view.addSubview(coffeeDescriptionLabel)
        view.addSubview(favoriteButton)
    }
    
    func configureViews() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .red
        tableView.backgroundColor = .clear
        tableView.rowHeight = 40
        tableView.isScrollEnabled = false
        tableView.separatorColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(OptionCell.self, forCellReuseIdentifier: OptionCell.reuseID)
        
        coffeeImageView.image = UIImage(named: coffee.name)
        coffeeImageView.isAccessibilityElement = true
        coffeeImageView.accessibilityHint = "coffee image"
        
        coffeeTitleLabel.text = coffee.name
        coffeeTitleLabel.isAccessibilityElement = true
        coffeeTitleLabel.accessibilityHint = "coffee name"
        coffeeTitleLabel.accessibilityLabel = "coffee name is \(coffee.name)"
        
        coffeeDescriptionLabel.text = coffee.description
        coffeeDescriptionLabel.isAccessibilityElement = true
        coffeeDescriptionLabel.accessibilityHint = "informations about the coffee"
        coffeeDescriptionLabel.accessibilityLabel = coffee.description
        
        favoriteButton.addTarget(self, action: #selector(addOrDeleteFavorites), for: .touchUpInside)
    }
    
    func configureViewController() {
        title = "Coffee"
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    func layoutUI() {
        NSLayoutConstraint.activate([
            coffeeImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            coffeeImageView.heightAnchor.constraint(equalToConstant: 200),
            coffeeImageView.widthAnchor.constraint(equalToConstant: 200),
            coffeeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            coffeeTitleLabel.topAnchor.constraint(equalTo: coffeeImageView.bottomAnchor, constant: 15),
            coffeeTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            coffeeDescriptionLabel.topAnchor.constraint(equalTo: coffeeTitleLabel.bottomAnchor, constant: 5),
            coffeeDescriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            coffeeDescriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            coffeeDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: coffeeDescriptionLabel.bottomAnchor, constant: 20),
            tableView.heightAnchor.constraint(equalToConstant: 120),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 20),
            
            favoriteButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            favoriteButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            favoriteButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            favoriteButton.heightAnchor.constraint(equalToConstant: 50),
            favoriteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    // MARK: - Action Outlets
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    @objc func addOrDeleteFavorites() {
        coffee.isFavorite.toggle()
        favoriteButton.set(isFavorite: !coffee.isFavorite)
    }
    
    // MARK: - TableView Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OptionCell.reuseID) as! OptionCell
        let option = options[indexPath.row]

        cell.set(option: option, status: instructionViewModel.getStateFor(indexPath.row))
        cell.selectionStyle = .none
        
        return cell
    }
    
    // MARK: - TableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        instructionViewModel.selectItemFor(indexPath.item)
        let cell = tableView.cellForRow(at: indexPath) as! OptionCell
        let strike = instructionViewModel.getStateFor(indexPath.item)
        cell.shouldStrikeThroughText(strike)
    }
}
