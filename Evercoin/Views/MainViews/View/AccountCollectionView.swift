//
//  AccountCollectionView.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 01.07.2025.
//

import SwiftUI

struct AccountCollectionView: View {
    @ObservedObject var viewModel: AccountViewModel
    @State private var selectedAccount: FinancesModel?

    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            LazyHStack(spacing: 8) {
//                ForEach(viewModel.accountArray.indices, id: \.self) { index in
//                    let currentAccount = viewModel.accountArray[index]
//
//                    AccountCollectionViewCell(accountInfo: currentAccount)
//                        .onTapGesture {
//                            selectedAccount = currentAccount
//                        }
//                }
//            }
//        }

        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 8) {
                ForEach(viewModel.accountArray.indices, id: \.self) { index in
//                    let currentAccount = viewModel.accountArray[index]
                    AccountCollectionViewCell(accountInfo: viewModel.accountArray[index])
//                        .onTapGesture(accountInfo: currentAccount) {
//                            selectedAccount = currentAccount
//                        }
//                    .onTapGesture {
//                        handleTap(on: index)
//                        withAnimation(.easeInOut(duration: 2)) {
//                            //                        withAnimation(.spring(duration: 2)) {
//                            showFullImage = true
//                        }
//                    }
                }
//                .padding(.leading, 4)
            }
        }
        .frame(maxHeight: 77)
//        .background(Color.gray)
//        .padding(.vertical, 8)
    }
}

#Preview {
    var accountViewModel = AccountViewModel()
    AccountCollectionView(viewModel: accountViewModel)
}
