//
//  CoffeeImageView.swift
//  Coffee Lister
//
//  Created by Can Balkaya on 1/28/21.
//

import UIKit

class CoffeeImageView: UIImageView {
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = frame.width
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
