//
//  CoffeeTitleLabel.swift
//  Coffee Lister
//
//  Created by Can Balkaya on 1/28/21.
//

import UIKit

class CoffeeTitleLabel: UILabel {
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment, textStyle: UIFont.TextStyle) {
        self.init(frame: .zero)
        
        self.textAlignment = textAlignment
        self.font = UIFont.preferredFont(forTextStyle: textStyle)
    }
}
