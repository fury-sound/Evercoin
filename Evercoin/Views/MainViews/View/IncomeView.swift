//
//  IncomeView.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 02.07.2025.
//

import SwiftUI

import SwiftUI
import Charts

struct IncomeView: View {
    @StateObject var viewModel = IncomeViewModel()

    var body: some View {
        IncomePieChartView(viewModel: viewModel)
            .padding(.top, 10)
        IncomeLegendView(viewModel: viewModel)
    }
}

#Preview {
    IncomeView()
}

struct IncomePieChartView: View {
    @ObservedObject var viewModel: IncomeViewModel

    var body: some View {
        Chart {
            ForEach(viewModel.incomeArray) { item in
                SectorMark(
                    angle: .value("Доходы", item.sum),
                    innerRadius: .ratio(0.75),  // Кольцевая диаграмма (опционально)
                    outerRadius: .inset(1),
                    angularInset: 1  // Отступ между секторами
                )
                .foregroundStyle(item.color)
                .cornerRadius(6)
            }
        }
//        .chartLegend(position: .bottom, alignment: .center)   Позиция легенды
        .chartLegend(.hidden)
        .frame(width: 145, height: 145)
        .padding(.top, 10)
        .chartBackground { proxy in
            VStack {
                Text("Июнь")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundStyle(.gray)
                //                Text("\(Int(viewModel.totalSum)) ₽")
                Text("120 000 ₽")
                    .font(.system(size: 15, weight: .regular))
                    .foregroundStyle(.ypBlack)
            }
        }
    }
}


struct IncomeViewCell: View {
    var incomeItem: FlowModel

    var body: some View {
        HStack {
            Circle()
                .fill(incomeItem.color)
                .frame(width: 12, height: 12)
            Text(incomeItem.title)
                .font(.system(size: 13, weight: .regular))
                .foregroundStyle(.ypBlack)
            Text("\(Int(incomeItem.sum)) ₽")
                .font(.system(size: 13, weight: .medium))
                .foregroundStyle(.ypBlack)
        }
        //                .padding(.horizontal, 6)
        //                .padding(6)
        .frame(maxWidth: .infinity, minHeight: 20, alignment: .leading)
    }
}

struct IncomeLegendView: View {
    @ObservedObject var viewModel: IncomeViewModel

    var body: some View {
        let columns = [
            GridItem(.flexible(), spacing: 12),
            GridItem(.flexible(), spacing: 12)
        ]
        LazyVGrid(
            columns: columns,
            spacing: 6
        ) {
            ForEach(viewModel.incomeArray, id: \.id) { item in
                IncomeViewCell(incomeItem: item)
            }
            //                        .border(Color.gray)
        }
        .padding(.horizontal, 16)
    }
}
