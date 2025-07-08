//
//  AnalyticsModel.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 06.07.2025.
//

import SwiftUI

struct SumTransactionModel {
    let name: String
    let icon: ImageResource
    let account: String
    let amount: Double
    let date: String
}

struct MockSumTransactionModel: Identifiable {
    var id: String
//    let name: String
    let icon: ImageResource
    let total: Int
    let amount: Double
    let color: Color
}

struct TransactionInCategoryModel {
    let category: String
    let operations: [SumTransactionModel]
}

struct MockTransactionInCategoryModel {
    let category: String
    let operations: [SumTransactionModel]
}

struct FlowModelByMonth: Identifiable {
    var month: String
    var category: String
    let amount: Double
    //    let expenseValue: Double
    var id: String { "\(month) - \(month)" }
}

