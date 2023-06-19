//
//  ContentView.swift
//  Calculator
//
//  Created by Jorge Luis Toledo on 4/3/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CalculatorViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                Spacer( )
                
                HStack {
                    Spacer()
                    
                    Text(viewModel.value)
                        .bold()
                        .font(.system(size: 100).weight(.light))
                }
                .padding()
                
                ForEach(viewModel.buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button {
                                viewModel.didTap(button: item)
                            } label: {
                                CalcButtonLabelView(item: item)
                            }
                        }
                    }
                    .padding(.bottom, 3)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
