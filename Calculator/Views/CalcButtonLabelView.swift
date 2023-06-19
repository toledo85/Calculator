//
//  CalcButtonLabelView.swift
//  Calculator
//
//  Created by Jorge Luis Toledo on 4/3/23.
//

import SwiftUI

struct CalcButtonLabelView: View {
    let item: Calculator.CalcButton
    
    var body: some View {
        Text(item.rawValue)
            .font(.system(size: 32))
            .frame(
                width: buttonWidth(item: item),
                height: buttonHeight())
            .background(item.buttonColor)
            .foregroundColor(.white)
            .cornerRadius(buttonWidth(item: item) / 2)
            // .clipShape(Circle())
    }
    
    private func buttonWidth(item: Calculator.CalcButton) -> CGFloat {
        if item == .zero {
            return (UIScreen.main.bounds.width - 4 * 12) / 2
        }
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
    
    private func buttonHeight() -> CGFloat {
        (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}

struct CalcButtonLabelView_Previews: PreviewProvider {
    static let viewModel = CalculatorViewModel()
    
    static var previews: some View {
        CalcButtonLabelView(item: viewModel.buttons.first!.first!)
            .previewLayout(.sizeThatFits)
    }
}
