//
//  AccountViewModel.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 01.07.2025.
//

import SwiftUI

let accountTotal = FinancesModel(id: 10, assets: "487 905 р", title: "Все счета", imageRes: .total, colorStart: Color.darkBlue, colorEnd: Color.navyBlue)
let accountTBank = FinancesModel(id: 20, assets: "87 905 р", title: "Карта Т-банк", imageRes: .tBank, colorStart: .blackTrue, colorEnd: .darkGray)
let accountCash = FinancesModel(id: 30, assets: "100 000 р", title: "Наличные", imageRes: .cash, colorStart: .pinkRed, colorEnd: .coralPink)
let accountYPay = FinancesModel(id: 40, assets: "300 000 р", title: "Яндекс Пэй", imageRes: .yandexPay, colorStart: .deepPurple, colorEnd: .vibrantPurple)

final class AccountViewModel: ObservableObject {
    let gradientPairs: [(Color, Color)] = [
        (Color.ypBlack, Color.ypDarkGray),
        (Color.violet, Color.pink),
        (Color.blue, Color.lightBlue2),
        (Color.darkBlue, Color.navyBlue),
        (Color.teal, Color.aqua),
        (Color.lime, Color.green),
        (Color.yellowGreen, Color.yellow),
        (Color.deepPurple, Color.purple),
        (Color.pinkRed, Color.coral),
        (Color.red, Color.orange),
        (Color.mediumPink, Color.hotPink),
        (Color.darkOrange, Color.lightOrange)
    ]
    let financeIcons: [ImageResource] = [.cash, .vtb, .total, .gazprombank, .tBank, .sovcombank, .alphabank, .uralsib, .sber, .raiffaisen, .yandexPayRound, .rshb]
    let accountArray = [accountTotal, accountTBank, accountCash, accountYPay]
}
