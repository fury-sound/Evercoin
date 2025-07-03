//
//  AccountListViewCell.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 04.07.2025.
//

import SwiftUI

struct AccountListViewCell: View {
    let accountInfo: FinancesModel

    var body: some View {

        VStack (alignment: .leading){
            HStack {
                Image(accountInfo.imageRes)
//                Image(.total)
                    .padding(.trailing, 8)
                Text(accountInfo.title)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundStyle(.ypWhite)
            }
            .padding(.bottom, 17)

            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text("Баланс")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(.ypWhite)
                        .padding(.bottom, 4)
                    Text(accountInfo.assets)
                        .font(.system(size: 15, weight: .medium))
                        .foregroundStyle(.ypWhite)
                }
                Spacer()
//                Image(systemName: "pencil")
                Image(.pencil)
            }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background(
            LinearGradient(gradient: Gradient(colors: [accountInfo.colorStart, accountInfo.colorEnd]),
                           startPoint: .leading, endPoint: .trailing)
        )
//        .background(
//            LinearGradient(gradient: Gradient(colors: [Color.darkBlue, Color.navyBlue]),
//                           startPoint: .leading, endPoint: .trailing)
//        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
//        .overlay(
//            RoundedRectangle(cornerRadius: 8)
//                .stroke(.accentGreen, lineWidth: 1)
//        )
        .padding(.horizontal, 20)
    }
}

#Preview {
    var accountInfo: FinancesModel = .init(id: 100, assets: "425 000 р", title: "Все счета", imageRes: .total, colorStart: .darkBlue, colorEnd: .navyBlue)
    AccountListViewCell(accountInfo: accountInfo)
}
