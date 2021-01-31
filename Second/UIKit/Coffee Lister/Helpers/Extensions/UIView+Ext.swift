//
//  UIView+Ext.swift
//  Coffee Lister
//
//  Created by Can Balkaya on 1/25/21.
//

import UIKit

extension UIView {
    
    // MARK: - Properties
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
