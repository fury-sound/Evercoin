//
//  ColorCellView.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 05.07.2025.
//

import SwiftUI

struct ColorCellView: View {
    let gradientPair: (Color, Color)
    let isSelected: Bool

    var body: some View {
        Circle()
            .fill(
                LinearGradient(gradient: Gradient(colors: [gradientPair.0, gradientPair.1]),
                               startPoint: .leading, endPoint: .trailing)
            )
            .frame(width: 50, height: 50)
            .clipShape(Circle())



//        VStack(alignment: .center) {
//            Image(icon)
//                .clipShape(Circle())
//        }
//        .frame(width: 50, height: 50)
//        .background(Color.gray.opacity(0.1))
//        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(isSelected ? Color.green : Color.clear, lineWidth: 2)
        )
    }
}

#Preview {
    ColorCellView(gradientPair: (Color.ypBlack, Color.ypDarkGray), isSelected: true)
}
