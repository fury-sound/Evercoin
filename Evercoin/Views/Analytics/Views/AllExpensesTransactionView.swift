//
//  AllExpensesTransactionView.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 06.07.2025.
//

import SwiftUI

struct AllExpensesTransactionView: View {
//    @ObservedObject var viewModel: AnalyticsViewModel
    @StateObject var viewModel = AnalyticsViewModel()

    var body: some View {

        ExpensesBarChartView(viewModel: viewModel)
        HStack {
            let totalTransactionForm: String = viewModel.operationWord(for: viewModel.totalTransactionNumber)
            Text("\(totalTransactionForm)")
                .font(.system(size: 15, weight: .semibold))
            Spacer()
            Text("-\(Int(viewModel.totalAmount)) ₽")
                .font(.system(size: 13, weight: .regular))
        }
        .foregroundStyle(.gray)
        .padding(.horizontal, 16)

        ScrollView(showsIndicators: false) {
            LazyVStack {
                ForEach(viewModel.sortedExpensesTotal) { item in
                    AllExpensesTransactionViewCell(viewModel: viewModel, itemExpenses: item)
                }
            }
        }
        .padding(.horizontal, 16)

    }
}

#Preview {
    var viewModel = AnalyticsViewModel()
//    AllExpensesTransactionView(viewModel: viewModel)
    var itemExpenses = MockSumTransactionModel(id: "Продукты", icon: .food, total: 17, amount: 38289, color: .red)
    AllExpensesTransactionViewCell(viewModel: viewModel, itemExpenses: itemExpenses)
}

#Preview {
    var viewModel = AnalyticsViewModel()
//    AllExpensesTransactionView(viewModel: viewModel)
    AllExpensesTransactionView()
}

struct AllExpensesTransactionViewCell: View {
    @ObservedObject var viewModel: AnalyticsViewModel
    @State var itemExpenses: MockSumTransactionModel

    var body: some View {
        HStack {
//            Image(.food)
            Image(itemExpenses.icon)
            VStack(alignment: .leading) {
                Text(itemExpenses.id)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(.ypBlack)
                let numOfTransactions: Int = itemExpenses.total
                let transactionForm: String = viewModel.operationWord(for: numOfTransactions)

//                Text("\(itemExpenses.total) операций")
                Text("\(transactionForm)")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(.ypBlack)
            }
            Spacer()
            Text("-\(Int(itemExpenses.amount)) ₽")
                .font(.system(size: 13, weight: .regular))
                .foregroundStyle(.red)
        }
    }
}
