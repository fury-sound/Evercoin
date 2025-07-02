//
//  HistoryView.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 02.07.2025.
//

import SwiftUI

struct HistoryView: View {
    @ObservedObject var viewModel: TransactionViewModel
    @State var searchString: String = ""

    var body: some View {

        VStack {
            Text("История операций")
                .font(.system(size: 17, weight: .medium))
                .foregroundStyle(.ypBlack)
                .padding(.top, 16)
            SearchBar(searchText: $searchString)

//            Spacer()
//            Text("Все")
//                .font(.system(size: 15, weight: .medium))
//                .foregroundStyle(.gray)
        }
        //        .background(.red)
//        .padding([.horizontal, .bottom], 16)
        ScrollView(showsIndicators: false) {
            HStack {
                Text("Сегодня")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(.ypBlack)
                Spacer()
//                Text("-10 531 ₽")
                let curResult = Int(viewModel.totalForDay(inArray: viewModel.todayList))
                Text("\(curResult) ₽")
                    .font(.system(size: 13, weight: .regular))
                    .foregroundStyle(.gray)
            }
            .padding(.top, 16)
            .padding(.bottom, 12)
            LazyVStack {
                ForEach(viewModel.todayList) { item in
                    TransactionViewCell(item: item)
                }
            }
            HStack {
                Text("Вчера")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(.ypBlack)
                Spacer()
                let curResult = Int(viewModel.totalForDay(inArray: viewModel.yesterdayList))
                Text("\(curResult) ₽")
//                Text("-3 000 ₽")
                    .font(.system(size: 13, weight: .regular))
                    .foregroundStyle(.gray)
            }
            .padding(.top, 16)
            .padding(.bottom, 12)
            LazyVStack {
                ForEach(viewModel.yesterdayList) { item in
                    TransactionViewCell(item: item)
                }
            }
            HStack {
                Text("27 июня")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(.ypBlack)
                Spacer()
                let curResult = Int(viewModel.totalForDay(inArray: viewModel.june27List))
                Text("\(curResult) ₽")
//                Text("-3 000 ₽")
                    .font(.system(size: 13, weight: .regular))
                    .foregroundStyle(.gray)
            }
            .padding(.top, 16)
            .padding(.bottom, 12)
            LazyVStack {
                ForEach(viewModel.june27List) { item in
                    TransactionViewCell(item: item)
                }
            }
            HStack {
                Text("26 июня")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(.ypBlack)
                Spacer()
                let curResult = Int(viewModel.totalForDay(inArray: viewModel.june26List))
                Text("\(curResult) ₽")
//                Text("-3 000 ₽")
                    .font(.system(size: 13, weight: .regular))
                    .foregroundStyle(.gray)
            }
            .padding(.top, 16)
            .padding(.bottom, 12)
            LazyVStack {
                ForEach(viewModel.june26List) { item in
                    TransactionViewCell(item: item)
                }
            }
        }
        .padding(.horizontal, 16)
    }
}


#Preview {
    var viewModel = TransactionViewModel()
    HistoryView(viewModel: viewModel)
}
