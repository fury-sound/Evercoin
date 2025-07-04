//
//  ColorCollectionView.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 05.07.2025.
//

import SwiftUI

struct ColorCollectionView: View {
    @ObservedObject var viewModel: AccountViewModel
    @State private var selectedGradient: (Color, Color)?
    private let rows = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 8) {
                ForEach(0..<viewModel.gradientPairs.count, id: \.self) { index in
                    let gradientPair = viewModel.gradientPairs[index]
                    ColorCellView(
                        gradientPair: gradientPair,
                        isSelected:
                            selectedGradient?.0 == gradientPair.0 &&
                        selectedGradient?.1 == gradientPair.1
                    )
                    .onTapGesture {
                        selectedGradient = gradientPair
                    }
                }
            }
            .padding(.horizontal, 8)
            .frame(height: 108)
        }
    }
}

#Preview {
    var accountViewModel = AccountViewModel()
    ColorCollectionView(viewModel: accountViewModel)
}
