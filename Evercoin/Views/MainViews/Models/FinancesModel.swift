//
//  FinancesModel.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 01.07.2025.
//

import SwiftUI

enum MoneyFlow: String, CaseIterable, Identifiable {
    var id: Self { self }
    case expense = "Расходы"
    case income = "Доходы"
}

enum TransactionType: String, CaseIterable, Identifiable {
    var id: Self { self }
    case expense = "Расходы"
    case income = "Зачисление"
    case transfer = "Перевод"
}

struct FinancesModel: Hashable, Identifiable {
    var id: Int
    var assets: String
    var title: String
    var imageRes: ImageResource
    var colorStart: Color
    var colorEnd: Color
}

struct FlowModel: Hashable, Identifiable  {
    var id: Int
    var title: String
    var sum: Double
    var color: Color
}

struct TotalFlowModel: Hashable  {
    var month: String
    var sum: Double
}

struct TransactionModel: Hashable, Identifiable  {
    var id = UUID()
    var title: String
    var category: String
    var sum: String
    var imageRes: ImageResource
    var flowType: Bool
}
