//
//  VoiceEntryView.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 04.07.2025.
//

import SwiftUI

struct VoiceEntryView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(alignment: .center){
            HStack{
                Button(action: {
                    dismiss()
                }) {
                    Text("Закрыть")
                        .font(.system(size: 17, weight: .medium))
                }
                Spacer()
                Button(action: {
                    dismiss()
                    print("Сохраняем данные после голосового ввода")
                }) {
                    Text("Сохранить")
                        .font(.system(size: 17, weight: .bold))
                }
            }
            .padding(.bottom, 60)
            Text("Добавьте операцию с помощью голосового ввода")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.ypBlack)
                .multilineTextAlignment(.center)
            Text("Например, «Расход за такси на 500 рублей 10 мая со счёта Яндекс Пэй»")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 22)
                .padding(.top, 12)
                .padding(.bottom, 40)
            Image(systemName: "microphone.fill")
                .font(.system(size: 50))
        }
        .padding(.top, 40)
        .padding(.horizontal, 23)
        Spacer()
    }
}

#Preview {
    VoiceEntryView()
}
