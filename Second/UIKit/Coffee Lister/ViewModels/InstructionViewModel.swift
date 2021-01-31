//
//  InstructionViewModel.swift
//  Coffee Lister
//
//  Created by Can Balkaya on 1/29/21.
//

import UIKit

struct InstructionViewModel {
    
    // MARK: - Properties
    var states = [Bool](repeating: false, count: 3)
    
    // MARK: - Methods
    func getStateFor(_ index: Int) -> Bool {
        return states[index]
    }
    
    mutating func selectItemFor(_ index: Int) {
        states[index].toggle()
    }
}
