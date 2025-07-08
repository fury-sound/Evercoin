//
//  MainView.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 29.06.2025.
//

import SwiftUI

struct MainView: View {
//    @StateObject var viewModel = TransactionViewModel()
//    @StateObject var accountViewModel = AccountViewModel()
    @ObservedObject var viewModel: TransactionViewModel
    @ObservedObject var accountViewModel: AccountViewModel

    var body: some View {

        NavigationStack {
            VStack {
                UpperHeaderView()
//                    .padding(.bottom, 8)
                AccountCollectionView(viewModel: accountViewModel)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
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
//        .edgesIgnoringSafeArea(.bottom)
    }
}


#Preview {
    var viewModel = TransactionViewModel()
    var accountViewModel = AccountViewModel()
    MainView(viewModel: viewModel, accountViewModel: accountViewModel)
}

#Preview {
    UpperHeaderView()
}

struct UpperHeaderView: View {
    var body: some View {
        HStack (alignment: .center, spacing: 16){
            Image(.logoMedium)
            Image(.title)
            Spacer()
            Image(systemName: "bell")
                .font(.system(size: 20, weight: .regular))
                .foregroundColor(.ypBlack)
        }
        .padding(.horizontal, 16)
//        .padding(.bottom, 16)
//        .background(Color.blue)



    }
}
