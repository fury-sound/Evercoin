//
//  AccountCollectionViewCell.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 01.07.2025.
//

import SwiftUI

struct AccountCollectionViewCell: View {

    let accountInfo: FinancesModel

    var body: some View {
        HStack {
            Image(accountInfo.imageRes)
                .padding(.leading, 16)
                .padding(.trailing, 8)
                .padding(.top, 23.5)
                .padding(.bottom, 23.5)
            VStack(alignment: .leading) {
            Text(accountInfo.assets)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(.ypBlack)
            Text(accountInfo.title)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(.ypBlack)
            }
            .padding(.trailing, 52)
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.accentGreen, lineWidth: 1)
//                .stroke(.red, lineWidth: 3)
        )
//        .background(Color.red)
    }
}

#Preview {
    var accountInfo: FinancesModel = .init(id: 100, assets: "425 000 р", title: "Все счета", imageRes: .total, colorStart: .darkBlue, colorEnd: .navyBlue)
    AccountCollectionViewCell(accountInfo: accountInfo)
}
