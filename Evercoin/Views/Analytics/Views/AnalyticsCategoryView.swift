//
//  AnalyticsCategoryView.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 05.07.2025.
//

import SwiftUI

struct AnalyticsCategoryView: View {
    @StateObject var viewModel = TransactionViewModel()
    @StateObject var accountViewModel = AccountViewModel()
//    @StateObject var accountViewModel = AccountViewModel()

    var body: some View {
        VStack {
            HStack {
                DropdownMenu(elementArray: monthArray, selectedElement: "Июнь")
                    .frame(width: 105)
                DropdownMenu(elementArray: allAccounts, selectedElement: "Все счета")
                    .frame(width: 130)
                DropdownMenu(elementArray: flowArray, selectedElement: "Расходы")
                    .frame(width: 100)
                Spacer()
            }
        }
//        .padding(.bottom, 12)
        .padding(.horizontal, 16)
//        ExpensesBarChartView(viewModel: viewModel)

        AllExpensesTransactionView()
        
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .onTapGesture {
//                viewModel.arrangeTransactions()
//            }
        Spacer()
    }
}

#Preview {
    AnalyticsCategoryView()
}
