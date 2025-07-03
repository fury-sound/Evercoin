//
//  Accounts.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 04.07.2025.
//

import SwiftUI

struct Accounts: View {
    @ObservedObject var viewModel: AccountViewModel

    var body: some View {
        Text("Мои счета")
            .padding(.bottom, 20)
            .font(.system(size: 20, weight: .bold))
            .foregroundStyle(.ypBlack)
        ScrollView(showsIndicators: false) {
            LazyVStack {
                ForEach(viewModel.accountArray, id: \.self) { account in
                    AccountListViewCell(accountInfo: account)
                }
            }
        }

    }
}

#Preview {
    var accountViewModel = AccountViewModel()
    Accounts(viewModel: accountViewModel)
}
