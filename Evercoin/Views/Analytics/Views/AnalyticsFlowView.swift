//
//  AnalyticsFlowView.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 05.07.2025.
//

import SwiftUI

struct AnalyticsFlowView: View {
    @ObservedObject var viewModel: TransactionViewModel

    var body: some View {
        VStack {
            HStack {
                DropdownMenu(elementArray: yearArray, selectedElement: "2025")
                    .frame(width: 80)
                DropdownMenu(elementArray: allAccounts, selectedElement: "Все счета")
                    .frame(width: 105)
                Spacer()
            }
//            .padding(.horizontal, 16)
            .padding(.bottom, 20)
            HStack {
                VStack(alignment: .leading) {
                    SmallHeaderText(text: "Доходы за год")
                    Text("783 291 ₽")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.green)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    SmallHeaderText(text: "Расходы за год")
                    Text("130 549 ₽")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.orange)
                }
            }
            .padding(.bottom, 12)
            HStack {
                VStack(alignment: .leading) {
                    SmallHeaderText(text: "В среднем")
                    Text("130 549 ₽/мес")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(.green)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    SmallHeaderText(text: "В среднем")
                    Text("106 974 ₽/мес")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(.orange)
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
        IncomeExpenseChartView()
        HStack {
            MoneyFlowRectangle(title: "Доходы", sum: "120 000 ₽", icon: ImageResource.iconIncome)
                .padding(.trailing, 12)
            MoneyFlowRectangle(title: "Расходы", sum: "75 789 ₽", icon: ImageResource.iconExpense)
        }
        .padding(.bottom, 12)
        .padding(.horizontal, 16)
        HistoryListView(viewModel: viewModel)
        Spacer()
    }
}

#Preview {
    var viewModel = TransactionViewModel()
    AnalyticsFlowView(viewModel: viewModel)
}
