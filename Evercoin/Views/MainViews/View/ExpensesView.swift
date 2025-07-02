//
//  ExpensesView.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 01.07.2025.
//

import SwiftUI
import Charts

struct ExpensesView: View {
    @StateObject var viewModel = ExpenseViewModel()

//    let columns = [
//        GridItem(.flexible(), spacing: 12),
//        GridItem(.flexible(), spacing: 12)
//    ]
    var body: some View {
        PieChartView(viewModel: viewModel)
            .padding(.top, 10)
        LegendView(viewModel: viewModel)
//            .padding(.horizontal, 8)
    }
}

#Preview {
    ExpensesView()
}

struct PieChartView: View {
    @ObservedObject var viewModel: ExpenseViewModel

    var body: some View {
        Chart {
            ForEach(viewModel.expenseArray) { item in
                SectorMark(
                    angle: .value("Расходы", item.sum),
                    innerRadius: .ratio(0.75),  // Кольцевая диаграмма (опционально)
                    outerRadius: .inset(1),
                    angularInset: 1  // Отступ между секторами
                )
                .foregroundStyle(item.color)
                .cornerRadius(6)
            }
        }
//        .chartLegend(position: .bottom, alignment: .center)  // Позиция легенды
        .chartLegend(.hidden)
        .frame(width: 145, height: 145)
        .padding(.top, 10)
        .chartBackground { proxy in
            VStack(spacing: 2) {
                Text("Июнь")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundStyle(.gray)
//                Text("\(Int(viewModel.totalSum)) ₽")
                Text("75 000 ₽")
                    .font(.system(size: 15, weight: .regular))
                    .foregroundStyle(.ypBlack)
            }
        }
    }
}


struct ExpensesViewCell: View {
    var expensesItem: FlowModel

    var body: some View {
        HStack {
            Circle()
                .fill(expensesItem.color)
                .frame(width: 12, height: 12)
            Text(expensesItem.title)
                .font(.system(size: 13, weight: .regular))
                .foregroundStyle(.ypBlack)
            Text("\(Int(expensesItem.sum)) ₽")
                .font(.system(size: 13, weight: .medium))
                .foregroundStyle(.ypBlack)
        }
        //                .padding(.horizontal, 6)
        //                .padding(6)
        .frame(maxWidth: .infinity, minHeight: 20, alignment: .leading)
    }
}

struct LegendView: View {
    @ObservedObject var viewModel: ExpenseViewModel

    var body: some View {
        let columns = [
            GridItem(.flexible(), spacing: 12),
            GridItem(.flexible(), spacing: 12)
        ]
        LazyVGrid(
            columns: columns,
            spacing: 6
        ) {
            ForEach(viewModel.expenseArray, id: \.id) { item in
                ExpensesViewCell(expensesItem: item)
            }
            //                        .border(Color.gray)
        }
        .padding(.horizontal, 16)
//        .background(.green)

        //        VStack(alignment: .leading, spacing: 8) {
        //            ForEach(viewModel.expenseArray) { item in
        //                HStack {
        //                    Circle()
        //                        .fill(item.color)
        //                        .frame(width: 12, height: 12)
        //
        //                    Text(item.title)
        //
        //                    Spacer()
        //
        //                    Text("\(item.sum.formatted(.number.precision(.fractionLength(0)))) р.")
        //                        .font(.subheadline)
        //                }
        //            }
        //        }
    }
}
