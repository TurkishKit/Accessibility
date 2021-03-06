//
//  FavoriteButton.swift
//  Coffee Lister
//
//  Created by Can Balkaya on 1/28/21.
//

import UIKit

class FavoriteButton: UIButton {
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 10
        setTitle("Add Favorites", for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        backgroundColor = .darkGreen
        tintColor = .white
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func set(isFavorite: Bool) {
        self.setTitle(isFavorite ? "Add Favorites" : "Delete Favorites", for: .normal)
        self.accessibilityLabel = !isFavorite ? "delete to favorites" : "add to favorites"
        self.accessibilityTraits = UIAccessibilityTraits.button
    }
}
