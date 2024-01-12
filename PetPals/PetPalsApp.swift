//
//  PetPalsApp.swift
//  PetPals
//
//  Created by Avya Rathod on 08/12/23.
//

import SwiftUI

class UserAuth: ObservableObject {
    @Published var isLoggedIn: Bool
    
    init(isLoggedIn: Bool = false) {
        self.isLoggedIn = isLoggedIn
    }
}


@main
struct PetPalsApp: App {
    // For development purposes, ignore the stored value and reset onboarding each launch
    @AppStorage("isOnboardingCompleted") var isOnboardingCompleted: Bool = false
    
    @Environment(\.dismiss) private var dismiss

    @StateObject var userAuth = UserAuth()

    init() {
        UserDefaults.standard.removeObject(forKey: "isOnboardingCompleted")
        print("UserDefaults reset for onboarding")
    }

    var body: some Scene {
        WindowGroup {
            if isOnboardingCompleted {
                MainTabView()
                    .environmentObject(userAuth)
            } else {
                OnboardingView(isOnboardingCompleted: $isOnboardingCompleted)
            }
        }
    }
}


struct MainTabView: View {
    @EnvironmentObject var userAuth: UserAuth
    
    @State private var selectedTab: Int = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Label("Explore", systemImage: "magnifyingglass")
            }
            .tag(0)

            NavigationStack {
                RequestView()
            }
            .tabItem {
                Label("Requests", systemImage: "paperplane")
            }
            .tag(1)

            NavigationStack {
                MessageView()
            }
            .tabItem {
                Label("Messages", systemImage: "message")
            }
            .tag(2)
        }
    }
}
