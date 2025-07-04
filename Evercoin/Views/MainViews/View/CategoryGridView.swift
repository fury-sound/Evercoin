//
//  CategoryGridView.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 02.07.2025.
//

import SwiftUI

struct CategoryGridView: View {
    @State private var selectedCategory: TransactionCategory?
    private let rows = [GridItem(), GridItem(), GridItem()]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 6) {
                ForEach(TransactionCategory.allCases, id: \.self) { category in
                    CategoryCellView(category: category, isSelected: selectedCategory == category)
                        .onTapGesture {
                            selectedCategory = category
                        }
                }
            }
            .padding(.horizontal, 16)
            .frame(height: 220)
//            .border(Color.gray)
        }
    }
}


#Preview {
    CategoryGridView()
}
