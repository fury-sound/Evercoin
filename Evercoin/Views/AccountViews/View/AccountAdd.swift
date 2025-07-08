//
//  AccountAdd.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 04.07.2025.
//

import SwiftUI

struct AccountAdd: View {
    @ObservedObject var viewModel: AccountViewModel
    @State private var inputCurrency: String = ""
    @State private var inputName: String = ""
    @State private var inputBalance: String = ""
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView(showsIndicators: false) {

        VStack(alignment: .leading) {
            CurrencyPickerField(title: "Валюта", placeholder: "Валюта", selectedCurrency: $inputCurrency)
            CommonTextField(title: "Название счета", placeholder: "Название счета", text: $inputName)
            CommonTextField(title: "Сумма", placeholder: "00,00 ₽", text: $inputBalance)
            Text("Иконка")
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(.ypBlack)
                .padding(.top, 12)
            IconCollectionView(viewModel: viewModel)
            Text("Фон")
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(.ypBlack)
                .padding(.top, 12)
            ColorCollectionView(viewModel: viewModel)
            HStack {
                Text("Сделать счетом по умолчанию")
                    .font(.system(size: 17, weight: .regular))
                    .foregroundStyle(.ypBlack)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Toggle("Сделать платеж регулярным", isOn: .constant(false))
                    .labelsHidden()
            }
            .padding(.bottom, 16)
            HStack {
                Text("Не показывать в общем балансе")
                    .font(.system(size: 17, weight: .regular))
                    .foregroundStyle(.ypBlack)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Toggle("Сделать платеж регулярным", isOn: .constant(false))
                    .labelsHidden()
            }
            Button {
                print("Сохраняем данные по операции")
            } label: {
                Text("Добавить")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.black)
                    .padding(.vertical, 12)
            }
            .frame(maxWidth: .infinity)
            .background(.accentGreen)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.brandBlue, lineWidth: 1)
            )
        }
        .padding(.horizontal, 16)
        .navigationBarBackButtonHidden(true)
        .buttonStyle(PlainButtonStyle())
        .navigationBarTitleDisplayMode(.inline)
//        .toolbar(.hidden, for: .tabBar)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color(.ypBlack))
                }
            }
            ToolbarItem(placement: .principal) {
                Text("Создать счет")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundStyle(Color(.ypBlack))
            }
        }

        }
//        Spacer()
    }
}

#Preview {
    var accountViewModel = AccountViewModel()
    AccountAdd(viewModel: accountViewModel)
}

struct CurrencyPickerField: View {
    let title: String
    let placeholder: String
    @Binding var selectedCurrency: String

    private let currencies = ["Российский рубль", "Доллар США", "Евро", "Китайский юань"]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(.ypBlack)

            Menu {
                ForEach(currencies, id: \.self) { currency in
                    Button(currency) {
                        selectedCurrency = currency
                    }
                }
            } label: {
                HStack {
                    Text(selectedCurrency.isEmpty ? placeholder : selectedCurrency)
                        .foregroundColor(selectedCurrency.isEmpty ? .gray : .ypBlack)
                        .font(.system(size: 17, weight: .regular))

                    Spacer()

                    Image(systemName: "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding(12)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
            }
        }
        .padding(.top, 12)
    }
}


//#Preview {
////    var accountViewModel = AccountViewModel()
//    CurrencyPickerField(title: <#String#>, selectedCurrency: <#Binding<String>#>)
//}

//struct CurrencyPickerField: View {
//    let title: String
//    @Binding var selectedCurrency: String
//
//    private let currencies = ["Рубли", "Доллары", "Евро", "Юани"]
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 8) {
//            Text(title)
//                .font(.system(size: 14, weight: .medium))
//                .foregroundStyle(.ypBlack)
//
//            Picker("", selection: $selectedCurrency) {
//                ForEach(currencies, id: \.self) { currency in
//                    Text(currency).tag(currency)
//                }
//            }
//            .pickerStyle(MenuPickerStyle())
//            .padding(12)
//            .background(Color.gray.opacity(0.1))
//            .cornerRadius(8)
//            .overlay(
//                HStack {
//                    Text(selectedCurrency.isEmpty ? "Выберите валюту" : selectedCurrency)
//                        .foregroundColor(selectedCurrency.isEmpty ? .gray : .ypBlack)
//                    Spacer()
//                    Image(systemName: "chevron.down")
//                }
//                    .padding(.horizontal, 12)
//            )
//        }
//        .padding(.top, 12)
//    }
//}
