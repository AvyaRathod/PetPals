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
                ExploreView()
            }
            .tabItem {
                Label("Explore", systemImage: "magnifyingglass")
            }
            
            NavigationStack {
                RequestsView()
            }
            .tabItem {
                Label("Requests", systemImage: "paperplane")
            }
            
            NavigationStack {
                MessagesView()
            }
            .tabItem {
                Label("Messages", systemImage: "message")
            }
        }
    }
}

struct ExploreView: View {
    var body: some View {
        Text("Explore Tab")
            .navigationTitle("Explore")
    }
}

struct RequestsView: View {
    var body: some View {
        Text("Requests Tab")
            .navigationTitle("Requests")
    }
}

struct MessagesView: View {
    var body: some View {
        Text("Messages Tab")
            .navigationTitle("Messages")
    }
}
