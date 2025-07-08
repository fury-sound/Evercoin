//
//  AnalyticsMainView.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 05.07.2025.
//

import SwiftUI

struct AnalyticsMainView: View {
    @ObservedObject var viewModel: TransactionViewModel

    var body: some View {
        Text("Аналитика")
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(.black)
            .padding(.bottom, 10)
        AnalyticsSelectionView(viewModel: viewModel)
//            .padding(.bottom, 10)
    }
}

#Preview("AnalyticsMainView") {
    var viewModel = TransactionViewModel()
    AnalyticsMainView(viewModel: viewModel)
}

#Preview("MoneyFlowRectangle_Income") {
    let title = "Доходы"
    let sum = "120 000 ₽"
    let icon = ImageResource.iconIncome
    MoneyFlowRectangle(title: title, sum: sum, icon: icon)
}

#Preview("MoneyFlowRectangle_Expense") {
    let title = "Расходы"
    let sum = "75 789 ₽"
    let icon = ImageResource.iconExpense
    MoneyFlowRectangle(title: title, sum: sum, icon: icon)
}

struct MoneyFlowRectangle: View {
    let title: String
    let sum: String
    let icon: ImageResource

    var body: some View {
        HStack {
            Image(icon)
                .padding(.horizontal, 12)
                .padding(.vertical, 19)
            VStack(alignment: .leading) {
                SmallHeaderText(text: title)
                Text(sum)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundStyle(.ypBlack)
            }
            .padding(.trailing, 52)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.accentGreen, lineWidth: 1)
        )
    }
}

struct SmallHeaderText: View {
    let text: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(text)
                .font(.system(size: 13, weight: .regular))
                .foregroundStyle(.gray)
        }
        .padding(.bottom, 4)
    }
}
