//
//  ExpenseViewModel.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 01.07.2025.
//

import Foundation

let products = FlowModel(id: 0, title: "Продукты", sum: 37500, color: .bgRed)
let transport = FlowModel(id: 1, title: "Транспорт", sum: 7500, color: .bgBlue2)
let fun = FlowModel(id: 2, title: "Развлечения", sum: 15000, color: .bgGreen2)
let cosmetics = FlowModel(id: 3, title: "Косметика", sum: 5250, color: .bgOrange2)
let otherExpense = FlowModel(id: 4, title: "Остальное", sum: 9750, color: .greyChart)
let totalExpense = TotalFlowModel(month: "Июнь", sum: 75000)

final class ExpenseViewModel: ObservableObject {
    @Published var expenseArray = [products, fun, transport, cosmetics, otherExpense]
}

