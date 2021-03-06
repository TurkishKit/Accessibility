//
//  Coffee.swift
//  Coffee Lister
//
//  Created by Can Balkaya on 1/28/21.
//

import Foundation

struct Coffee {
    
    // MARK: - UI Elements
    let name: String
    let description: String
    var isFavorite: Bool
    let options: [String]
    
    static let coffees = [
        Coffee(name: "Caffee Americano", description: "Espresso shots topped with hot water create a light layer of crema culminating in this wonderfully rich cup with depth and nuance.  Pro Tip: For an additional boost, ask your barista to try this with an extra shot.", isFavorite: false, options: ["Espresso Shot", "Soya Sütü", "Ahududu Şurubu", "Vanilya Şurubu", "Strawberry"]),
        Coffee(name: "Caramel Brulee Latte", description: "Our signature espresso, steamed milk and rich caramel brulée sauce finished with whipped cream and a supreme topping of even more caramel brulée.", isFavorite: false, options: [""]),
        Coffee(name: "Caramel Macchiato", description: "Freshly steamed milk with vanilla-flavored syrup marked with espresso and topped with a caramel drizzle for an oh-so-sweet finish.", isFavorite: false, options: [""]),
        Coffee(name: "White Chocolate Mocha", description: "Our signature espresso meets white chocolate sauce and steamed milk, and then is finished off with sweetened whipped cream to create this supreme white chocolate delight.", isFavorite: false, options: [""])
    ]
}
