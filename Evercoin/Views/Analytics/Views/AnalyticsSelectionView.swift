//
//  AnalyticsSelectionView.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 05.07.2025.
//

import SwiftUI

struct AnalyticsSelectionView: View {
    @ObservedObject var viewModel: TransactionViewModel
    @State private var analyticsItems: AnalyticsItems = .flowData
    
    var body: some View {
        VStack {
            Picker("", selection: $analyticsItems) {
                ForEach(AnalyticsItems.allCases) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal, 16)
            .padding(.bottom, 10)

            // Контейнер для вью
            Group {
                switch analyticsItems {
                    case .flowData:
                        AnalyticsFlowView(viewModel: viewModel)
                    case .categories:
                        AnalyticsCategoryView()
                }
            }
            .transition(.opacity) // Анимация перехода
        }
        .animation(.easeInOut, value: analyticsItems)
//        Spacer()
    }

}

#Preview {
    var viewModel = TransactionViewModel()
    AnalyticsSelectionView(viewModel: viewModel)
}
