//
//  TransactionViewCell.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 02.07.2025.
//

import SwiftUI

struct TransactionViewCell: View {
    var item: TransactionModel

    var body: some View {
        HStack {
            Image(item.imageRes)
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(.ypBlack)
                Text(item.category)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(.gray)
            }
            Spacer()
            Text(item.sum)
                .font(.system(size: 13, weight: .regular))
                .foregroundStyle(item.flowType == false ? .red : .green)

        }
    }
}

#Preview("Expenses") {
    var item = TransactionModel(title:  "Пятерочка", category: "Продукты", sum: "-1 659,99 ₽", imageRes: .food, flowType: false)
    TransactionViewCell(item: item)
}

#Preview("Income") {
    var item = TransactionModel(title:  "Зарплата", category: "Зарплата", sum: "+96 000 ₽", imageRes: .salary, flowType: true)
    TransactionViewCell(item: item)
}
