//
//  OptionCell.swift
//  Coffee Lister
//
//  Created by Can Balkaya on 1/29/21.
//

import UIKit

class OptionCell: UITableViewCell {
    
    // MARK: - UI Elements
    lazy var checkmarkButton = UIButton()
    lazy var descriptionLabel = UILabel()
    
    // MARK: - Properties
    static let reuseID = "OptionCell"
    
    // MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        checkmarkButton.isAccessibilityElement = true
        checkmarkButton.accessibilityTraits = UIAccessibilityTraits.button
        checkmarkButton.clipsToBounds = true
        checkmarkButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(checkmarkButton)
        
        descriptionLabel.isAccessibilityElement = true
        descriptionLabel.clipsToBounds = true
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            checkmarkButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            checkmarkButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            checkmarkButton.widthAnchor.constraint(equalToConstant: 40),
            checkmarkButton.heightAnchor.constraint(equalToConstant: 40),
            
            descriptionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: checkmarkButton.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func shouldStrikeThroughText(_ strikeThrough: Bool) {
        guard let text = descriptionLabel.text else { return }
        let attributeString =  NSMutableAttributedString(string: text)
      
        checkmarkButton.isAccessibilityElement = false
      
        if strikeThrough {
            descriptionLabel.accessibilityLabel = "Completed: \(text)"
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(text.startIndex..., in: text))
        } else {
            descriptionLabel.accessibilityLabel = "Uncompleted: \(text)"
        }
      
        let buttonImage = UIImage(systemName: strikeThrough ? "checkmark.square.fill" : "checkmark.square")
        checkmarkButton.setImage(buttonImage, for: .normal)
        descriptionLabel.attributedText = attributeString
    }
    
    // MARK: - Methods
    func set(option: String, status: Bool) {
        checkmarkButton.setImage(UIImage(systemName: status ? "checkmark.square.fill" : "checkmark.square")!, for: .normal)
        descriptionLabel.text = option
    }
}
