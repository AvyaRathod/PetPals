//
//  RequestView.swift
//  PetPals
//
//  Created by Avya Rathod on 16/12/23.
//

import SwiftUI

struct RequestView: View {
    @State private var searchLocation: String = ""
    @State private var selectedDates = Date() // Holds the selected date
    @State private var selectedTime = Date() // Holds the selected time
    @State private var showingDatePicker = false
    @State private var showingTimePicker = false
    
    // Date and time formatter
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    private var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color("app_yellow")) // Use the color you want for the rounded rectangle
                .frame(height: 200) // Set the height you want for the rounded rectangle
            
            HStack(spacing: 20) {
                // Replace these with actual images and titles for your services
                ServiceIconView(serviceName: "Boarding", imageName: "boarding-icon")
                ServiceIconView(serviceName: "Daycare", imageName: "daycare-icon")
                ServiceIconView(serviceName: "Sitting", imageName: "sitting-icon")
                ServiceIconView(serviceName: "Walking", imageName: "walking-icon")
            }
            .padding(.top, 90.0)
        }
        .edgesIgnoringSafeArea(.top)
        .offset(y: -170)
        
        //search menu
        VStack {
            // Search location input
            TextField("Search location", text: $searchLocation)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            // Choose dates button and display
            Button(action: {
                showingDatePicker.toggle()
            }) {
                HStack {
                    Image(systemName: "calendar")
                    Text(dateFormatter.string(from: selectedDates))
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding()
            }
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            .sheet(isPresented: $showingDatePicker) {
                // Date Picker
                DatePicker("Choose dates", selection: $selectedDates, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
            }
            
            // Set time button and display
            Button(action: {
                showingTimePicker.toggle()
            }) {
                HStack {
                    Image(systemName: "clock")
                    Text(timeFormatter.string(from: selectedTime))
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding()
            }
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            .sheet(isPresented: $showingTimePicker) {
                // Time Picker
                DatePicker("Set time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                    .padding()
            }
            
            // Select pets field (Placeholder for your implementation)
            HStack {
                Image(systemName: "tortoise")
                Text("Select pets")
                Spacer()
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            
            // Search button
            Button("Search") {
                // Perform search action
            }
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.brown) // Use the color that matches your design
            .cornerRadius(8)
        }
        .padding()
    }
}

struct ServiceIconView: View {
    var serviceName: String
    var imageName: String

    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            Text(serviceName)
        }
    }
}

#Preview {
    RequestView()
}
