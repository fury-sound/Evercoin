//
//  IncomeViewModel.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 01.07.2025.
//

import Foundation

let salary = FlowModel(id: 0, title: "Зарплата", sum: 96000, color: .bgYellow)
let transferIncome = FlowModel(id: 1, title: "Переводы", sum: 18000, color: .bgPink)
let otherIncome = FlowModel(id: 2, title: "Остальное", sum: 6000, color: .greyChart)
let totalIncome = TotalFlowModel(month: "Июнь", sum: 120000)

final class IncomeViewModel: ObservableObject {
    let incomeArray = [salary, transferIncome, otherIncome]
}
