//
//  MainView.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 29.06.2025.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = TransactionViewModel()
    @StateObject var accountViewModel = AccountViewModel()

    var body: some View {

        NavigationStack {
            VStack {
                AccountCollectionView(viewModel: accountViewModel)
                MoneyView()

                ZStack (alignment: .bottom){
                    TransactionView()
                    NavigationLink {
                        TransactionAdd(viewModel: viewModel, accountViewModel: accountViewModel)
                    } label: {
                        Circle()
                            .frame(width: 54, height: 54)
                            .foregroundColor(.accentGreen)
                            .overlay(
                                Image(.addSign)
                            )
                            .padding(.bottom, 8)
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    MainView()
}
