//
//  AccountCollectionView.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 01.07.2025.
//

import SwiftUI

struct AccountCollectionView: View {
@StateObject var viewModel = AccountViewModel()

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(viewModel.accountArray.indices, id: \.self) { index in
                    AccountViewCell(accountInfo: viewModel.accountArray[index])
                    //                    .onTapGesture {
                    //                        handleTap(on: index)
                    //                        withAnimation(.easeInOut(duration: 2)) {
                    //                            //                        withAnimation(.spring(duration: 2)) {
                    //                            showFullImage = true
                    //                        }
                    //                    }
                }
                .padding(.leading, 4)
            }
//            .background(Color.gray)
        }
//        .padding(.horizontal, 16)
        .frame(maxHeight: 80)
    }
}

#Preview {
    AccountCollectionView()
}
