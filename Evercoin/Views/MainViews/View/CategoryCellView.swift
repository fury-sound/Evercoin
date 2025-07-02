//
//  CategoryCellView.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 03.07.2025.
//

import SwiftUI

struct CategoryCellView: View {
    let category: TransactionCategory
    let isSelected: Bool

    var body: some View {
        VStack(spacing: 8) {
            Image(category.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
            Text(category.title)
                .font(.system(size: 11, weight: .medium))
                .foregroundStyle(.ypBlack)
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
        .frame(width: 100, height: 66)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(isSelected ? Color.accentGreen : Color.clear, lineWidth: 2)
        )
    }
}


#Preview("with selection") {
    var category: TransactionCategory { .health }
    CategoryCellView(category: category, isSelected: true)
}

#Preview("no selection") {
    var category: TransactionCategory { .health }
    CategoryCellView(category: category, isSelected: false)
}
