//
//  DropdownMenu.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 06.07.2025.
//

import SwiftUI

struct DropdownMenu: View {

//    @State private var selectedFruit = "Яблоко"
//    let fruits = ["Яблоко", "Дыня", "Слива"]

    @State private var selectedElement: String //= elementArray[0] // = "Яблоко"
    let elementArray: [String]

    init(elementArray: [String], selectedElement: String) {
        self.elementArray = elementArray
        self.selectedElement = selectedElement
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
//            Text("Фрукты")
//                .font(.system(size: 13))
//                .foregroundColor(.ypBlack)

            // Основной контейнер меню
            Menu {
                ForEach(elementArray, id: \.self) { element in
                    Button(action: {
                        selectedElement = element
                    }) {
                        Text(element)
                    }
                }
            } label: {
                HStack {
                    Text(selectedElement)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(Color(.ypBlack))

                    Spacer()

                    Image(systemName: "chevron.down")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundStyle(Color(.ypBlack))
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
//                .frame(width: 80)
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .fill(.greyChart)
                )
                //                .overlay(
                //                    RoundedRectangle(cornerRadius: 6)
                //                        .stroke(Color(.gray), lineWidth: 1)
                //                )
            }
            .menuStyle(BorderlessButtonMenuStyle())
        }
//        .frame(width: 80)
//        .padding()
    }
}

#Preview {
    DropdownMenu(elementArray: yearArray, selectedElement: "2025")
}
