//
//  Calculator.swift
//  Calculator
//
//  Created by Jorge Luis Toledo on 4/3/23.
//

import Foundation

struct Calculator {
    var value = "2.2"
    
    private var runningNumber = 0.0
    private var currentOperation = Operation.none
    
    mutating func didTap(_ button: CalcButton) {
        switch button {
            case .add, .subtract, .multiply, .divide:
                addArithmeticOperation(button)
            case .equal:
                addEqual(button)
            case .clear:
                value = "0"
                currentOperation = .none
            case .decimal:
                addDot()
            case .negative:
                addNegative()
            case .percent:
                addPercent()
            default:
                addNumber(button)
        }
    }
    
    mutating private func addArithmeticOperation(_ button: CalcButton) {
        if button == .add {
            currentOperation = .add
        } else if button == .subtract {
            currentOperation = .subtract
        } else if button == .multiply {
            currentOperation = .multiply
        } else if button == .divide {
            currentOperation = .divide
        }
        
        runningNumber = Double(value) ?? 0
        value = "0"
    }
    
    mutating private func addEqual(_ button: CalcButton) {
        let currentValue = Double(value) ?? 0
        
        print(runningNumber)
        print(currentValue)
        
        switch currentOperation {
            case .add:
                runningNumber += currentValue
                value = String(format: "%g", runningNumber)
            case .subtract:
                runningNumber -= currentValue
                value = String(format: "%g", runningNumber)
            case .multiply:
                runningNumber *= currentValue
                value = String(format: "%g", runningNumber)
            case .divide:
                if currentValue != 0 {
                    runningNumber /= currentValue
                    value = String(format: "%g", runningNumber)
                } else {
                    value = "NaN"
                }
             default:
                break
        }
        
        currentOperation = .equal
        
        print(runningNumber)
    }
    
    mutating private func addDot() {
        let currentValue = Double(value) ?? 0
        let roundedValue = round(currentValue)
        
        if currentOperation == .equal {
            value = "0."
        } else if currentValue == roundedValue {
            value = String(format: "%g.", currentValue)
        }
    }
    
    mutating private func addPercent() {
        let currentValue = Double(value) ?? 0
        runningNumber = currentValue / 100
        
        value = String(format: "%g", runningNumber)
    }
    
    mutating private func addNegative() {
        let currentValue = Double(value) ?? 0
        value = String(format: "%g", -currentValue)
    }
    
    mutating private func addNumber(_ button: CalcButton) {
        if value == "0"  {
            value = button.rawValue
        } else if value != "0" && currentOperation == .equal  {
            value = button.rawValue
        } else {
            value += button.rawValue
        }
    }
    
    enum CalcButton: String {
        case one = "1"
        case two = "2"
        case three = "3"
        case four = "4" 
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case zero = "0"
        case add = "+"
        case subtract = "-"
        case divide = "/"
        case multiply = "x"
        case equal = "="
        case clear = "C"
        case decimal = "."
        case percent = "%"
        case negative = "-/+"
    }
    
    private enum Operation {
        case add
        case subtract
        case multiply
        case divide
        case equal
        case dot
        case none
    }
}
