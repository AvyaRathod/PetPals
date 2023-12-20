//
//  PetPalsApp.swift
//  PetPals
//
//  Created by Avya Rathod on 08/12/23.
//

import SwiftUI

@main
struct PetPalsApp: App {
    // For development purposes, ignore the stored value and reset onboarding each launch
    @AppStorage("isOnboardingCompleted") var isOnboardingCompleted: Bool = false

    init() {
        UserDefaults.standard.removeObject(forKey: "isOnboardingCompleted")
        print("UserDefaults reset for onboarding")
    }
    
    var body: some Scene {
        WindowGroup {
            if isOnboardingCompleted {
                MainTabView()
            } else {
                OnboardingView(isOnboardingCompleted: $isOnboardingCompleted)
            }
        }
    }
}

struct MainTabView: View {
    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Label("Explore", systemImage: "magnifyingglass")
            }
            
            NavigationStack {
                RequestView()
            }
            .tabItem {
                Label("Requests", systemImage: "paperplane")
            }
            
            NavigationStack {
                MessageView()
            }
            .tabItem {
                Label("Messages", systemImage: "message")
            }
        }
    }
}
