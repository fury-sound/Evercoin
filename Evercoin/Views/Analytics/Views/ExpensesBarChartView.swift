//
//  ExpensesBarChartView.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 06.07.2025.
//

import SwiftUI
import Charts

struct ExpensesBarChartView: View {
    @ObservedObject var viewModel: AnalyticsViewModel

    var body: some View {
        VStack {
            // График
            // Заголовок "Июнь"
            Text("Июнь")
                .font(.headline)
                .padding(.top, 8)
            Chart {
                ForEach(viewModel.sortedExpensesTotal, id: \.id) { expense in
                    BarMark(
                        x: .value("Категория", expense.id),
                        y: .value("Сумма", expense.amount)
                    )
                    .foregroundStyle(by: .value("Категория", expense.id))
                    .cornerRadius(10)
                }
            }
            .chartForegroundStyleScale(
                domain: viewModel.sortedExpensesTotal.map { $0.id },
                range: viewModel.sortedExpensesTotal.map { $0.color }
            )
            .chartLegend(position: .bottom, alignment: .center, spacing: 16)
            .chartXAxis(.hidden)
            .chartYAxis {
                AxisMarks(position: .leading)
            }
            .frame(height: 250)
        }
        .padding()
    }
}

#Preview {
    var viewModel = AnalyticsViewModel()
    ExpensesBarChartView(viewModel: viewModel)
}
