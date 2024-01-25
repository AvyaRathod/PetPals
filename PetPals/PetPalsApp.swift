//
//  PetPalsApp.swift
//  PetPals
//
//  Created by Avya Rathod on 08/12/23.
//

import SwiftUI

class UserAuth: ObservableObject {
    @Published var isLoggedIn: Bool {
        didSet {
            UserDefaults.standard.set(isLoggedIn, forKey: "isLoggedIn")
        }
    }
    
    init(isLoggedIn: Bool = false) {
        self.isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
}

class ServiceProvider: ObservableObject {
    @Published var isServiceProvider: Bool {
        didSet {
            UserDefaults.standard.set(isServiceProvider, forKey: "isServiceProvider")
        }
    }
    
    init(isServiceProvider: Bool = false) {
        self.isServiceProvider = UserDefaults.standard.bool(forKey: "isServiceProvider")
    }
}

class BookingManager: ObservableObject {
    @Published var bookings: [Booking] = []
    
    func addBooking(serviceProviderID:UUID, serviceProviderName: String, serviceProviderAddr: String, bookingCost: String, startDate: Date, endDate: Date, startTime: Date, endTime: Date, selectedPets: Set<String>, selectedService: String, status: BookingStatus, paymentStatus: PaymentStatus) {
        let newBooking = Booking(serviceProviderID: serviceProviderID, serviceProviderName: serviceProviderName, serviceProviderAddr: serviceProviderAddr, bookingCost: bookingCost, startDate: startDate, endDate: endDate, startTime: startTime, endTime: endTime, selectedPets: selectedPets, selectedService: selectedService, status: status, paymentStatus: paymentStatus)
        bookings.append(newBooking)
        print("booking added")
    }
}

@main
struct PetPalsApp: App {
    @StateObject var userAuth = UserAuth()
    @StateObject var serviceProvider = ServiceProvider()
    @StateObject var userBooking = BookingManager()

    @AppStorage("isOnboardingCompleted") var isOnboardingCompleted: Bool = UserDefaults.standard.bool(forKey: "isOnboardingCompleted")
    
    // delete this init when development is completed.
    init() {
            // Reset for development purposes
            UserDefaults.standard.set(false, forKey: "isLoggedIn")
            UserDefaults.standard.set(false, forKey: "isServiceProvider")
            UserDefaults.standard.set(false, forKey: "isOnboardingCompleted")

            // Initialize the @AppStorage property
            _isOnboardingCompleted = AppStorage(wrappedValue: false, "isOnboardingCompleted")

            // Initialize the state objects with updated values from UserDefaults
            _userAuth = StateObject(wrappedValue: UserAuth())
            _serviceProvider = StateObject(wrappedValue: ServiceProvider())
        }
    
    var body: some Scene {
        WindowGroup {
            if isOnboardingCompleted {
                MainTabView()
                    .environmentObject(userAuth)
                    .environmentObject(serviceProvider)
                    .environmentObject(userBooking)
            } else {
                OnboardingView(isOnboardingCompleted: $isOnboardingCompleted)
            }
        }
    }
}


struct MainTabView: View {
    @EnvironmentObject var userAuth: UserAuth
    @EnvironmentObject var serviceProvider: ServiceProvider

    
    var body: some View {
        if !serviceProvider.isServiceProvider{
            TabView{
                NavigationStack {
                    HomeView()
                }
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }

                NavigationStack {
                    MessageView()
                }
                .tabItem {
                    Label("Messages", systemImage: "message")
                }
            }
        }else{
            TabView{
                NavigationStack {
                    HomeView()
                }
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
                NavigationStack {
                    HomeView()
                }
                .tabItem {
                    Label("My listing", systemImage: "magnifyingglass")
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
}
