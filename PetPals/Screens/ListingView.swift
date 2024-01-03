//
//  ListingView.swift
//  PetPals
//
//  Created by user2 on 02/01/24.
//

import SwiftUI

struct ListingView: View {
    @State private var selectedTab = 0
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .fill(Color("app_brown"))
                .frame(height: 210)
                .padding(.bottom, 620)
                .edgesIgnoringSafeArea(.top)
                
            VStack {
                Text("My Bookings")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.zero)
                    .foregroundColor(.white)
                    .padding(.zero)
                Picker(selection: $selectedTab, label: Text("")) {
                    Text("Current Bookings")
                        .tag(0)
                    Text("Past Bookings")
                        .tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .background(Color.appYellow.opacity(1))
                .cornerRadius(20)
                .padding(.top, -12)
                .padding()
                
                // Tabs content based on selection
                ScrollView{
                    if selectedTab == 0 {
                        Text("No Current Bookings Found.")
                            .padding(.top)
                        
                    } else {
                        Text("No Past Bookings Found.")
                    }
                    
                    Spacer()
                }
            }
            .padding()
        }
    }
}

#Preview {
    ListingView()
}
