//
//  MainTabView.swift
//  Evercoin
//
//  Created by Valery Zvonarev on 06.07.2025.
//

import SwiftUI

// 1. Перечисление для вкладок
enum Tab: String, CaseIterable {
    case home = "Главная"
    case accounts = "Счета"
    case analytics = "Аналитика"
    case profile = "Профиль"

    var icon: String {
        switch self {
            case .home: return "house.fill"
            case .accounts: return "creditcard.fill"
            case .analytics: return "chart.bar.fill"
            case .profile: return "person.fill"
        }
    }
}

struct MainTabView: View {
    @StateObject var viewModel = TransactionViewModel()
    @StateObject var accountViewModel = AccountViewModel()
    @State private var selectedTab = 0

    var body: some View {
        TabView {
            // 1-я вкладка: Главная
            NavigationStack {
                MainView(viewModel: viewModel, accountViewModel: accountViewModel)
            }
            .tabItem {
                Image("homeIcon")
                    .renderingMode(.template) // Это важно!
                Text("Главная")
//                Label("Главная", image: "homeIcon")
//                Label("Главная", systemImage: "house")
            }
            // 2-я вкладка: Счета
            NavigationStack {
                AccountsMainView(viewModel: accountViewModel)
            }
            .tabItem {
                Image("accountsIcon")
                    .renderingMode(.template) // Это важно!
                Text("Счета")
//                Label("Счета", image: "accountsIcon")
//                Label("Счета", systemImage: "creditcard.fill")
            }
            // 3-я вкладка: Аналитика
            NavigationStack {
                AnalyticsMainView(viewModel: viewModel)
            }
            .tabItem {
                Image("analyticsIcon")
                    .renderingMode(.template)
                Text("Аналитика")
//                Label("Аналитика", image: "analyticsIcon")
//                Label("Аналитика", systemImage: "chart.bar.fill")
            }
            // 4-я вкладка: Профиль
            NavigationStack {
                ProfileView()
            }
            .tabItem {
                Image("profileIcon")
                    .renderingMode(.template)
                Text("Профиль")
//                Label("Профиль", image: "profileIcon")
//                Label("Профиль", systemImage: "person.fill")
            }
        }
        .tint(.ypBlack) // Цвет активной вкладки

    }
}

// 3. Заглушки для экранов (замените на свои View)
//struct HomeView: View {
//    var body: some View {
//        Text("Главная")
//            .font(.largeTitle)
//    }
//}
//
//struct AccountsView: View {
//    var body: some View {
//        Text("Счета")
//            .font(.largeTitle)
//    }
//}
//
//struct AnalyticsView: View {
//    var body: some View {
//        Text("Аналитика")
//            .font(.largeTitle)
//    }
//}

struct ProfileView: View {
    var body: some View {
        Text("Профиль")
            .font(.largeTitle)
    }
}

#Preview {
    MainTabView()
}
