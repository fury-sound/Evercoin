//
//  TransactionView.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 02.07.2025.
//

import SwiftUI

struct TransactionView: View {
    @StateObject var viewModel = TransactionViewModel()
    @State private var showingHistory = false

    var body: some View {

        VStack {
            HStack {
                Text("Последние операции")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundStyle(.ypBlack)
                Spacer()
                Button(action: {
                    showingHistory = true
                }) {
                    Text("Все")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundStyle(.gray)
                }
                .sheet(isPresented: $showingHistory) {
                    HistoryView(viewModel: viewModel)
                        .presentationDetents([.medium, .large])
                }
            }
            .padding([.horizontal, .bottom], 16)
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.todayList) { item in
                        TransactionViewCell(item: item)
                    }
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    TransactionView()
}



