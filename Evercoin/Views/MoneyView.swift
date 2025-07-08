//
//  MoneyView.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 01.07.2025.
//

import SwiftUI

struct MoneyView: View {
    @State private var moneyFlow: MoneyFlow = .expense
    var body: some View {
        VStack {
            Picker("", selection: $moneyFlow) {
                ForEach(MoneyFlow.allCases) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal, 16)
            // Контейнер для вью
            Group {
                switch moneyFlow {
                    case .income:
                        IncomeView()
                            .frame(height: 120)
                    case .expense:
                        ExpensesView()
                            .frame(height: 120)
                }
            }
            .transition(.opacity) // Анимация перехода
        }
        .animation(.easeInOut, value: moneyFlow)
//        .background(Color.gray)
    }
}

#Preview("MoneyView") {
    MoneyView()
}
