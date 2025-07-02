//
//  MainView.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 29.06.2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            AccountCollectionView()
            MoneyView()
            TransactionView()
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    MainView()
}
