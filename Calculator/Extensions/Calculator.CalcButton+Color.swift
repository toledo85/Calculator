//
//  CalC.swift
//  Calculator
//
//  Created by Jorge Luis Toledo on 4/3/23.
//

import SwiftUI

extension Calculator.CalcButton {
    var buttonColor: Color {
        switch self {
            case .add, .subtract, .multiply, .equal:
                return .orange
            case .clear, .negative, .percent:
                return Color(.lightGray)
            default:
                return Color(red: 55/255, green: 55/255, blue: 55/255)
        }
    }
}
