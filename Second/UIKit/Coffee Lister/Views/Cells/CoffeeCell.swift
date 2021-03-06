//
//  CoffeeCell.swift
//  Coffee Lister
//
//  Created by Can Balkaya on 1/28/21.
//

import UIKit

class CoffeeCell: UITableViewCell {
    
    // MARK: - UI Elements
    lazy var coffeeImageView = CoffeeImageView(frame: .zero)
    lazy var coffeeTitleLabel = CoffeeTitleLabel(textAlignment: .left, textStyle: .headline)
    
    // MARK: - Properties
    static let reuseID = "CoffeeCell"
    
    // MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        coffeeTitleLabel.isAccessibilityElement = true
        coffeeTitleLabel.accessibilityHint = "coffe name"
        
        addSubview(coffeeImageView)
        addSubview(coffeeTitleLabel)
        
        accessoryType = .disclosureIndicator
        
        NSLayoutConstraint.activate([
            coffeeImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            coffeeImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            coffeeImageView.heightAnchor.constraint(equalToConstant: 60),
            coffeeImageView.widthAnchor.constraint(equalToConstant: 60),
            
            coffeeTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            coffeeTitleLabel.leadingAnchor.constraint(equalTo: coffeeImageView.trailingAnchor, constant: 24),
            coffeeTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            coffeeTitleLabel.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func set(coffee: Coffee) {
        coffeeImageView.image = UIImage(named: coffee.name)
        coffeeTitleLabel.text = coffee.name
        self.accessibilityLabel = "Coffee Name is \(coffee.name)"
    }
}
