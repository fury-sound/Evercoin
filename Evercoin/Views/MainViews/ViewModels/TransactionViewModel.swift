//
//  TransactionViewModel.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 02.07.2025.
//

import SwiftUI

enum TransactionCategory: CaseIterable, Hashable {
    case beauty
    case cafe
    case fun
    case food
    case health
    case home
    case mortgage
    case salary
    case sport
    case taxi
    case transfer
    case transferPlus
    case telephony
    case transport
    case utilities
    case other

    var title: String {
        switch self {
            case .beauty: return "Красота"
            case .cafe: return "Рестораны"
            case .fun: return "Развлечения"
            case .food: return "Продукты"
            case .health: return "Здоровье"
            case .home: return "Дом и ремонт"
            case .mortgage: return "Ипотека"
            case .salary: return "Зарплата"
            case .sport: return "Спорт"
            case .taxi: return "Такси"
            case .transfer: return "Перевод"
            case .transferPlus: return "Перевод"
            case .telephony: return "Мобильная связь"
            case .transport: return "Транспорт"
            case .utilities: return "ЖКХ"
            case .other: return "Иное"
        }
    }

    var icon: ImageResource {
        switch self {
            case .beauty: return .beauty
            case .cafe: return .cafe
            case .fun: return .fun
            case .food: return .food
            case .health: return .health
            case .home: return .home
            case .mortgage: return .mortgage
            case .salary: return .salary
            case .sport: return .sport
            case .taxi: return .taxi
            case .transfer: return .transfer
            case .transferPlus: return .transferPlus
            case .telephony: return .telephony
            case .transport: return .transport
            case .utilities: return .utilities
            case .other: return .add
        }
    }
}

let transaction1 = TransactionModel(title:  "Пятерочка", category: "Продукты", sum: "-1 659.99 ₽", imageRes: .food, flowType: false)
let transaction2 = TransactionModel(title:  "Зарплата", category: "Зарплата", sum: "+96 000 ₽", imageRes: .salary, flowType: true)
let transaction3 = TransactionModel(title:  "Метро", category: "Транспорт", sum: "-500 ₽", imageRes: .transport, flowType: false)
let transaction4 = TransactionModel(title:  "Эрмитаж", category: "Развлечения", sum: "-1000 ₽", imageRes: .fun, flowType: false)
let transaction5 = TransactionModel(title:  "Витамины", category: "Здоровье", sum: "-270 ₽", imageRes: .health, flowType: false)
let transaction6 = TransactionModel(title:  "Катя Д.", category: "Переводы", sum: "-1000 ₽", imageRes: .transfer, flowType: false)
let transaction7 = TransactionModel(title:  "КУ и вода", category: "ЖКХ", sum: "-6 101.01 ₽", imageRes: .utilities, flowType: false)

let transaction8 = TransactionModel(title:  "МТС", category: "Мобильная связь", sum: "-500 ₽", imageRes: .telephony, flowType: false)
let transaction9 = TransactionModel(title:  "Маникюр", category: "Красота", sum: "-2 500 ₽", imageRes: .beauty, flowType: false)

let transaction10 = TransactionModel(title:  "Тренировка по пилатесу", category: "Спорт", sum: "-1 200 ₽", imageRes: .sport, flowType: false)
let transaction11 = TransactionModel(title:  "Такси с работы", category: "Такси", sum: "-478 ₽", imageRes: .taxi, flowType: false)
let transaction12 = TransactionModel(title:  "Маша М.", category: "Переводы", sum: "+7 000 ₽", imageRes: .transferPlus, flowType: true)

let transaction13 = TransactionModel(title:  "Лента", category: "Продукты", sum: "-782,88 ₽", imageRes: .food, flowType: false)
let transaction14 = TransactionModel(title:  "Лампочки", category: "Дом и ремонт", sum: "-239 ₽", imageRes: .home, flowType: false)

final class TransactionViewModel: ObservableObject {
    var todayList: [TransactionModel] = [transaction1, transaction2, transaction3, transaction4, transaction5, transaction6, transaction7]
    var yesterdayList: [TransactionModel] = [transaction8, transaction9]
    var june27List: [TransactionModel] = [transaction10, transaction11, transaction12]
    var june26List: [TransactionModel] = [transaction13, transaction14]

//    func getCurrentDateFormatted() -> String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd.MM.yyyy"
//        return formatter.string(from: Date())
//    }

    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.string(from: date)
    }

    func totalForDay(inArray: [TransactionModel]) -> Double {
        let finalResult = inArray.reduce(0) { (result, transaction) -> Double in
            // Убираем символы и пробелы из строки суммы
            let sumString = transaction.sum.replacingOccurrences(of: "₽", with: "").replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "-", with: "").replacingOccurrences(of: "+", with: "")
//            print("sumString", sumString)

            // Преобразуем строку в Double
            if let sumValue = Double(sumString) {
                // Если flowType true, добавляем сумму, иначе вычитаем
                return result + (transaction.flowType ? sumValue : -sumValue)
            }
            return result
        }
        return finalResult
    }
}
