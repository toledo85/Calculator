//
//  ContentViewModel.swift
//  Calculator
//
//  Created by Jorge Luis Toledo on 4/3/23.
//

import SwiftUI

class CalculatorViewModel: ObservableObject {
    private static let buttons: [[Calculator.CalcButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    @Published private var model = Calculator()
    
    var buttons: [[Calculator.CalcButton]] {
        CalculatorViewModel.buttons
    }
    
    var value: String {
        model.value
    }
    
    func didTap(button: Calculator.CalcButton) {
        model.didTap(button)
    }
}
