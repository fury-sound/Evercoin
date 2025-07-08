//
//  AccountsMainView.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 04.07.2025.
//

import SwiftUI

struct AccountsMainView: View {
    @ObservedObject var viewModel: AccountViewModel

    var body: some View {
        NavigationStack {
        Text("Мои счета")
            .padding(.bottom, 20)
            .font(.system(size: 20, weight: .bold))
            .foregroundStyle(.ypBlack)
            ScrollView(showsIndicators: false) {
                AccountListViewCellAdd(viewModel: viewModel)
                    .padding(.top, 16)
                    .padding(.bottom, 8)
                LazyVStack {
                    ForEach(viewModel.accountArray, id: \.self) { account in
                        AccountListViewCell(accountInfo: account)
                    }
                }
            }
        }
    }
}

#Preview {
    var accountViewModel = AccountViewModel()
    AccountsMainView(viewModel: accountViewModel)
}
