//
//  TransactionAdd.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 02.07.2025.
//

import SwiftUI

struct TransactionAdd: View {
    @ObservedObject var viewModel: TransactionViewModel
    @ObservedObject var accountViewModel: AccountViewModel
    @State private var inputSum: String = ""
    @State private var inputName: String = ""
    @State private var inputDate: String = ""
    @State private var inputComment: String = ""
    @State private var showVoiceInput = false
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(alignment: .leading) {
//            HStack {
//                Image(systemName: "chevron.left")
//                Spacer()
//                Text("Добавить операцию")
//                    .font(.system(size: 17, weight: .medium))
//                    .foregroundStyle(.ypBlack)
//                Spacer()
//                Image(systemName: "microphone")
//            }
            TransactionPicker()
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    CommonTextField(title: "Сумма", placeholder: "00,00 ₽", text: $inputSum)
                    CommonTextField(title: "Название", placeholder: "Введите название", text: $inputName)
                    Text("Счет списания")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(.ypBlack)
                        .padding(.top, 12)
                    AccountCollectionView(viewModel: accountViewModel)
                        .padding(.bottom, 2)
                    Text("Категория")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(.ypBlack)
                        .padding(.top, 12)
                    CategoryGridView()

                    DateTextField(viewModel: viewModel, title: "Дата", placeholder: "\(viewModel.formatDate(Date.now))", text: $inputDate)
                    CommonTextField(title: "Комментарий", placeholder: "Введите комментарий", text: $inputComment)

                    HStack {
                        Text("Сделать платеж регулярным")
                            .font(.system(size: 17, weight: .regular))
                            .foregroundStyle(.ypBlack)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Toggle("Сделать платеж регулярным", isOn: .constant(false))
                            .labelsHidden()
                    }
                    .padding(.vertical, 12)

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
            }

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
                Text("Добавить операцию")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundStyle(Color(.ypBlack))
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showVoiceInput = true
                } label: {
                    Image(systemName: "microphone")
                        .foregroundStyle(Color(.ypBlack))
                }
            }
        }
        .sheet(isPresented: $showVoiceInput) {
            VoiceEntryView()
                .presentationDetents([.medium])
        }
        Spacer()
    }
}

#Preview {
    var viewModel = TransactionViewModel()
    var accountViewModel = AccountViewModel()
    TransactionAdd(viewModel: viewModel, accountViewModel: accountViewModel)
}

struct CommonTextField: View {
    let title: String
    let placeholder: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(.ypBlack)
            TextField(placeholder, text: $text)
                .padding(12)
                .font(.system(size: 17, weight: .regular))
                .background(.gray.opacity(0.1))
                .cornerRadius(8)
        }
        .padding(.top, 12)
    }
}

struct DateTextField: View {
    @ObservedObject var viewModel: TransactionViewModel
    let title: String
    let placeholder: String
    @Binding var text: String
    @State private var showDatePicker: Bool = false
    @State private var selectedDate = Date()

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(.ypBlack)
            HStack {
                TextField(placeholder, text: $text)
                    .padding(12)
                    .font(.system(size: 17, weight: .regular))
                    .background(.gray.opacity(0.1))
                    .cornerRadius(8)
                Button(action: {
                    showDatePicker = true
                }) {
                    Image(systemName: "calendar")
                        .padding(14)
                        .foregroundStyle(.ypBlack)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                }
                .buttonStyle(.plain)            }
        }
        .padding(.top, 12)
        .sheet(isPresented: $showDatePicker) {
            VStack {
                DatePicker("Выберите дату",
                           selection: $selectedDate,
                           displayedComponents: .date
                )
                .datePickerStyle(.graphical)
                .padding()
                .onChange(of: selectedDate) { newDate in
                    text = viewModel.formatDate(newDate)
                    showDatePicker = false
                }
                Button("Готово") {
                    showDatePicker = false
                }
                .padding()
            }
            .presentationDetents([.medium])
        }
    }
}

struct TransactionPicker: View {
    @State private var transactionType: TransactionType = .expense
    var body: some View {
        VStack {
            Picker("", selection: $transactionType) {
                ForEach(TransactionType.allCases) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.segmented)
            //            .padding(.horizontal, 16)
            // Контейнер для вью
            Group {
                switch transactionType {
                    case .expense:
                        EmptyView()
                    case .income:
                        EmptyView()
                    case .transfer:
                        EmptyView()
                }
            }
            .transition(.opacity) // Анимация перехода
        }
        .animation(.easeInOut, value: transactionType)
    }
}
