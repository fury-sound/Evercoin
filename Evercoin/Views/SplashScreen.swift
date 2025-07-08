//
//  SplashScreen.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 29.06.2025.
//

import SwiftUI

struct SplashScreen: View {
    @State var isActive: Bool = false

    var body: some View {
        ZStack(alignment: .center) {
            if self.isActive {
                EnterView()
//                ContentView()
            } else {
//                Rectangle()
//                    .background(Color.white)
                VStack{
                    GIFView("splashVideo")
                        .frame(maxWidth: .infinity , maxHeight: .infinity , alignment: .center)
                }
//                Image(.logoBig)
//                    .ignoresSafeArea(.all)
            }
        }
        .foregroundStyle(.clear)
        .backgroundStyle(.white)

        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
