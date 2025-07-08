//
//  EnterView.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 29.06.2025.
//

import SwiftUI

struct EnterView: View {
    @State private var emailText: String = ""
    @State private var passwordText: String = ""
    @State private var isShowingMainView = false

    var body: some View {
        NavigationStack {
            HStack(alignment: .bottom) {
                Text("Вход")
                    .font(.system(size: 34, weight: .medium))
                    .foregroundStyle(.ypBlack)
                    .padding(.trailing, 16)
                Image(.logo)
                    .alignmentGuide(.bottom){ d in d[.bottom]}
                Spacer()
            }
            .padding(.top, 114)
            .padding(.leading, 16)
            .padding(.bottom, 32)
            VStack(alignment: .leading) {
                TextField("Электронная почта", text: $emailText)
                    .font(.system(size: 18, weight: .regular))
                    .padding(.vertical, 16)
                    .padding(.leading, 24)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.lightBlue, lineWidth: 2)
                    )
                    .padding(.bottom, 16)
                SecureField("Пароль", text: $passwordText)
                    .font(.system(size: 18, weight: .regular))
                    .padding(.vertical, 16)
                    .padding(.leading, 24)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.lightBlue, lineWidth: 2)
                    )

                Button {
                    print("переход к Забыли пароль")
                } label: {
                    Text("Забыли пароль?")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.black)
                }
                .padding(.bottom, 32)
                .padding(.top, 8)

            }
            .padding(.horizontal, 16)

            HStack {
                Button {
                    isShowingMainView = true
                    print("переход на основной экран")
                } label: {
                    HStack (spacing: 8){
                        Text("Войти")
                            .font(.system(size: 20, weight: .medium))
                        Image(systemName: "chevron.right")
                            .font(.system(size: 20, weight: .medium))
                    }
                    .foregroundColor(.brandBlue)
                    .frame(maxWidth: .infinity)
                }
                .padding()
                .background(.accentGreen)
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.brandBlue, lineWidth: 2)
                )
            }
            .navigationDestination(isPresented: $isShowingMainView) {
//                MainView()
                MainTabView()
                    .navigationBarBackButtonHidden(true)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 36)

            Text("Вход с помощью соцсетей")
                .font(.system(size: 14, weight: .regular))
                .foregroundStyle(.ypBlack)
            HStack(spacing: 12) {
                Button {
                    print("вход через Google на основной экран")
                } label: {
                    HStack (spacing: 8){
                        Image(.iconGoogle)
                            .font(.system(size: 20, weight: .medium))
                    }
                }
                Button {
                    print("вход через VK на основной экран")
                } label: {
                    HStack (spacing: 8){
                        Image(.iconVk)
                            .font(.system(size: 20, weight: .medium))
                    }
                }
                Button {
                    print("вход через Yandex на основной экран")
                } label: {
                    HStack (spacing: 8){
                        Image(.iconYandex)
                            .font(.system(size: 20, weight: .medium))
                    }
                }
            }

            Spacer()

            Button {
                print("открыть окно регистрации")
            } label: {
                Text("Зарегистрироваться")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundStyle(.black)
            }
            .padding([.horizontal, .bottom], 43)
        }

    }
}

#Preview {
    EnterView()
}
