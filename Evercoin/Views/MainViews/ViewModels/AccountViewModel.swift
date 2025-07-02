//
//  AccountViewModel.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 01.07.2025.
//

import Foundation

let accountTotal = FinancesModel(assets: "487 905 р", title: "Все счета", imageRes: .total)
let accountTBank = FinancesModel(assets: "87 905 р", title: "Карта Т-банк", imageRes: .tBank)
let accountCash = FinancesModel(assets: "100 000 р", title: "Наличные", imageRes: .cash)
let accountYPay = FinancesModel(assets: "300 000 р", title: "Яндекс Пэй", imageRes: .yandexPay)

final class AccountViewModel: ObservableObject {
    let accountArray = [accountTotal, accountTBank, accountCash, accountYPay]
}
