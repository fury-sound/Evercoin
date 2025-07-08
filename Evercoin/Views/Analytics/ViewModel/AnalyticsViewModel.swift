//
//  AnalyticsViewModel.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 06.07.2025.
//

import SwiftUI

let monthsData = [
    FlowModelByMonth(month: "Янв", category: "Доходы", amount: 150000),
    FlowModelByMonth(month: "Янв", category: "Расходы", amount: 100000),
    FlowModelByMonth(month: "Фев", category: "Доходы", amount: 140000),
    FlowModelByMonth(month: "Фев", category: "Расходы", amount: 150000),
    FlowModelByMonth(month: "Март", category: "Доходы", amount: 115000),
    FlowModelByMonth(month: "Март", category: "Расходы", amount: 95000),
    FlowModelByMonth(month: "Апр", category: "Доходы", amount: 160000),
    FlowModelByMonth(month: "Апр", category: "Расходы", amount: 150000),
    FlowModelByMonth(month: "Май", category: "Доходы", amount: 130000),
    FlowModelByMonth(month: "Май", category: "Расходы", amount: 105000),
    FlowModelByMonth(month: "Июнь", category: "Доходы", amount: 120000),
    FlowModelByMonth(month: "Июнь", category: "Расходы", amount: 75000)
]

final class AnalyticsViewModel: ObservableObject {
    let foodTotal = MockSumTransactionModel(id: "Продукты", icon: .food, total: 17, amount: 38289, color: .red)
    let funTotal = MockSumTransactionModel(id: "Развлечения", icon: .fun, total: 8, amount: 18000, color: .accentGreen)
    let transportTotal = MockSumTransactionModel(id: "Транспорт", icon: .transport, total: 21, amount: 7500, color: .lightBlue2)
    let cosmeticsTotal = MockSumTransactionModel(id: "Косметика", icon: .cosmetics, total: 8, amount: 5250, color: .orange)
    let transferTotal = MockSumTransactionModel(id: "Переводы", icon: .transfer, total: 5, amount: 3000, color: .violet)
    let beautyTotal = MockSumTransactionModel(id: "Красота", icon: .beauty, total: 1, amount: 2500, color: .lightBlue)
    let taxiTotal = MockSumTransactionModel(id: "Такси", icon: .taxi, total: 7, amount: 2310, color: .coralPink)
    let cafeTotal = MockSumTransactionModel(id: "Кафе", icon: .cafe, total: 3, amount: 1000, color: .green)
    let utilitiesTotal = MockSumTransactionModel(id: "ЖКХ", icon: .utilities, total: 1, amount: 940, color: .yellow)
    let healthTotal = MockSumTransactionModel(id: "Здоровье", icon: .health, total: 1, amount: 100, color: .coralPink)

    var expensesTotal: [MockSumTransactionModel] = []
    var sortedExpensesTotal: [MockSumTransactionModel] = []
    var totalAmount: Double = 0
    var totalTransactionNumber: Int = 0

    init() {
        expensesTotal = [
            foodTotal,
            funTotal,
            transportTotal,
            cosmeticsTotal,
            transferTotal,
            beautyTotal,
            taxiTotal,
            cafeTotal,
            utilitiesTotal,
            healthTotal
        ]
        sortedExpensesTotal = expensesTotal.sorted { $0.amount > $1.amount }
        totalAmount = expensesTotal.reduce(0) { $0 + $1.amount }
        totalTransactionNumber = expensesTotal.reduce(0) { $0 + $1.total }
    }

    func operationWord(for count: Int) -> String {
        let absCount = abs(count) // Берем абсолютное значение для корректной обработки отрицательных чисел
        switch absCount % 10 {
            case 1 where absCount % 100 != 11:
                return "\(count) операция"
            case 2, 3, 4 where absCount % 100 != 12 && absCount % 100 != 13 && absCount % 100 != 14:
                return "\(count) операции"
            default:
                return "\(count) операций"
        }
    }
//    func showExpensesTotalList() {
//
//    }
}
