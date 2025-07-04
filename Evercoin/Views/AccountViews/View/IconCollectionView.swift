//
//  IconCollectionView.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 05.07.2025.
//

import SwiftUI

struct IconCollectionView: View {
    @ObservedObject var viewModel: AccountViewModel
    @State private var selectedIcon: ImageResource?
    private let rows = [GridItem(), GridItem()]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 6) {
                ForEach(0..<viewModel.financeIcons.count, id: \.self) { index in
                    ////                    CategoryCellView(category: category, isSelected: selectedCategory == category)
                    let icon = viewModel.financeIcons[index]
                    IconCellView(icon: icon, isSelected: selectedIcon == icon)
                    //                    Image(icon)
                        .onTapGesture {
                            selectedIcon = icon
                        }
                }
            }
            .padding(.horizontal, 16)
                        .frame(height: 108)
            //            .border(Color.gray)
        }
    }
}

#Preview {
    var accountViewModel = AccountViewModel()
    IconCollectionView(viewModel: accountViewModel)
}

#Preview {
    IconCellView(icon: .alphabank, isSelected: true)
    IconCellView(icon: .sber, isSelected: false)
    IconCellView(icon: .rshb, isSelected: true)
}

#Preview("total") {
    IconCellView(icon: .total, isSelected: true)
    IconCellView(icon: .cash, isSelected: true)
}

struct IconCellView: View {
    let icon: ImageResource
    let isSelected: Bool

    var body: some View {
        VStack(alignment: .center) {
            Image(icon)
//                .resizable()
//                .scaledToFit()
//                .frame(width: 28, height: 28)
                .clipShape(Circle())
        }
        .frame(width: 50, height: 50)
        .background(Color.gray.opacity(0.1))
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(isSelected ? Color.accentGreen : Color.clear, lineWidth: 2)
        )
    }
}

