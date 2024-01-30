//
//  CheckoutView.swift
//  PetPals
//
//  Created by Avya Rathod on 11/01/24.
//

import SwiftUI
import MapKit

struct CheckoutView: View {
    
    let results: Pal
    
    @Binding var startDate: Date
    @Binding var endDate: Date
    @Binding var startTime: Date
    @Binding var endTime: Date
    @Binding var selectedPets: Set<String>
    @Binding var selectedService: String
    
    @State private var selectedPaymentMethod: String?
    
    var PrefPaymentOpt = ["Paytm UPI", "Google Pay" , "Pay at the end(Cash/UPI)"]
    var otherPaymentOpt = ["asdf@okhdfcbank", "omvin@aubank"]
    
    @EnvironmentObject var userBooking: BookingManager

    var body: some View {
        VStack{
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    
                    // Booking Details
                    VStack{
                        VStack(alignment: .leading) {
                            Text(results.name)
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Text(results.address)
                                .font(.footnote)
                                .foregroundColor(.secondary)
                            
                            HStack {
                                ForEach(0..<results.rating, id: \.self) { _ in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                }
                            }
                        }
                        .padding()
                        
                        Divider()
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("From")
                                Text(startDate, style: .date)
                                    .fontWeight(.bold)
                                Text(startTime, style: .time)
                                    .fontWeight(.bold)
                            }
                            Spacer()
                            Divider()
                                .frame(height: 50.0)
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("To")
                                Text(endDate, style: .date)
                                    .fontWeight(.bold)
                                Text(endTime, style: .time)
                                    .fontWeight(.bold)
                            }
                        }
                        .padding([.leading, .trailing])
                        
                        Divider()
                        
                        HStack {
                            Text("Pets")
                            Spacer()
                            Text(selectedPets.joined(separator: ", "))
                                .fontWeight(.bold)
                        }
                        .padding([.leading, .trailing, .top])
                        
                        Divider()
                        
                        HStack {
                            Text("Service")
                            Spacer()
                            Text(selectedService)
                                .fontWeight(.bold)
                        }
                        .padding([.leading, .trailing, .top])
                        
                        Divider()
                        
                        // Price Details
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Price")
                                    .font(.title2)
                                Spacer()
//                                Text(results.cost)
                                    .font(.title2)
                                    .fontWeight(.bold)
                            }
                            .padding([.leading, .trailing, .top])
                            
                            HStack {
                                Text("Taxes")
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text("₹ 136")
                                    .foregroundColor(.secondary)
                            }
                            .padding([.leading, .trailing])
                        }
                    }
                    .padding()
                    .frame(width:360)
                    .background (.white)
                    .clipShape (RoundedRectangle (cornerRadius: 12))
                    .padding()
                    .shadow(radius: 10)
                    
                    // Payment options
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Preferred payment options")
                            .font(.headline)
                            .padding(.bottom, 5)
                        
                        ForEach(PrefPaymentOpt, id: \.self) { paymentOption in
                                            PaymentMethodView(methodName: paymentOption, selectedPaymentMethod: $selectedPaymentMethod, results: results,
                                                              startDate: $startDate,
                                                              endDate: $endDate,
                                                              startTime: $startTime,
                                                              endTime: $endTime,
                                                              selectedPets:$selectedPets,
                                                              selectedService:$selectedService).environmentObject(userBooking)
                                        }
                        
                        Text("Pay by any UPI App")
                            .font(.headline)
                            .padding(.top)
                        
                        VStack {
                            ForEach(otherPaymentOpt, id: \.self) { paymentOption in
                                                PaymentMethodView(methodName: paymentOption, selectedPaymentMethod: $selectedPaymentMethod, results: results,
                                                                  startDate: $startDate,
                                                                  endDate: $endDate,
                                                                  startTime: $startTime,
                                                                  endTime: $endTime,
                                                                  selectedPets:$selectedPets,
                                                                  selectedService:$selectedService)
                                            }
                            
                            Button("Add New UPI ID") {
                                // Implement the Add New UPI action
                            }
                            .foregroundColor(.blue)
                        }
                        
                    }
                    .padding(.horizontal)
                    
                }
            }
//            VStack(alignment: .leading) {
//                Divider()
//                HStack {
//                    Text(results.cost)
//                        .font(.title)
//                        .fontWeight(.bold)
//                }
//                .padding([.leading, .trailing, .top])
//            }
        }
        .navigationTitle("Final Step")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PaymentMethodView: View {
    var methodName: String
    @Binding var selectedPaymentMethod: String?
    
    let results: Pal
    
    @Binding var startDate: Date
    @Binding var endDate: Date
    @Binding var startTime: Date
    @Binding var endTime: Date
    @Binding var selectedPets: Set<String>
    @Binding var selectedService: String
    @EnvironmentObject var bookingManager: BookingManager

    @State private var navigateToConfirmation = false

    var body: some View {
        VStack {
            HStack {
                Text(methodName)
                    .fontWeight(.medium)
                Spacer()
                Image(systemName: selectedPaymentMethod == methodName ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(selectedPaymentMethod == methodName ? .blue : .gray)
            }

            if selectedPaymentMethod == methodName {
                Button(action: {
                    if methodName == "Pay on Delivery (Cash/UPI)" {
                        bookingManager.addBooking(serviceProviderID: results.id,
                                                  serviceProviderName: results.name,
                                                  serviceProviderAddr: results.address,
                                                  bookingCost: "to be updated",
                                                  startDate: startDate,
                                                  endDate: endDate,
                                                  startTime: startTime,
                                                  endTime: endTime,
                                                  selectedPets: selectedPets,
                                                  selectedService: selectedService,
                                                  status: .confirmed,
                                                  paymentStatus: .payOnDelivery)
                    } else {
                        bookingManager.addBooking(serviceProviderID: results.id,
                                                  serviceProviderName: results.name,
                                                  serviceProviderAddr: results.address,
                                                  bookingCost: "to be updated",
                                                  startDate: startDate,
                                                  endDate: endDate,
                                                  startTime: startTime,
                                                  endTime: endTime,
                                                  selectedPets: selectedPets,
                                                  selectedService: selectedService,
                                                  status: .confirmed,
                                                  paymentStatus: .paid)
                    }
                    navigateToConfirmation = true
                }) {
                    Text("Pay via \(methodName)")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor.systemGray6)))
        .onTapGesture {
            self.selectedPaymentMethod = methodName
        }
        .navigationDestination(isPresented: $navigateToConfirmation) {
            BookingConfirmationView(results: results,
                                    startDate: $startDate,
                                    endDate: $endDate,
                                    startTime: $startTime,
                                    endTime: $endTime,
                                    selectedPets: $selectedPets,
                                    selectedService: $selectedService)
        }
    }
}


struct CheckoutView_Previews: PreviewProvider {
    @State static var mockDestination: String = "Guduvancheri, India"
    @State static var mockStartDate: Date = Date()
    @State static var mockEndDate: Date = Date()
    @State static var selectedService = "walking"
    @State static var selectedPets:Set<String> = ["Tuffy", "Jerry", "Max", "Buddy"]
    
    static var previews: some View {
        NavigationView {
            CheckoutView(results: Pal(
                name: "Alice Johnson",
                profileImage: "petimage-1",
                rating: 4,
                address: "123 anywhere st. any city state country 123",
                summary: "I love spending time with furry friends and have a spacious backyard for them to play.",
                servicesOffered: [
                    ServicesOffered(name: .dayboarding, description: "Overnight care for your pet", price: "INR 150/Night"),
                    ServicesOffered(name: .daycare, description: "Daytime care", price: "INR 100/Day")
                ],
                acceptedPets: ["Cats", "Dogs"],
                neighborhoodLocation: CLLocationCoordinate2D(latitude: 12.9716, longitude: 77.5946),
                reviews: [
                    Review(review: "Alice was wonderful with my Max!", rating: 5, username: "John Doe", profileImage: "profilepic-1"),
                    Review(review: "Very caring and attentive.", rating: 4, username: "Emma Stone", profileImage: "profilepic-2"),
                    Review(review: "Best pet sitter in town!", rating: 5, username: "Mike Ross", profileImage: "profilepic-3"),
                    Review(review: "Highly recommend Alice for pet sitting.", rating: 4, username: "Sarah Connor", profileImage: "profilepic-4")
                ],
                contactInfo: ContactInformation(
                    phoneNumber: "1234567890",
                    instagramHandle: "@alicepets",
                    whatsappNumber: "9876543210"
                )
            ),
                         startDate: $mockStartDate, endDate: $mockEndDate, startTime: $mockStartDate, endTime: $mockEndDate,
                         selectedPets:$selectedPets,
                         selectedService:$selectedService)
            .environmentObject(BookingManager())

        }
    }
}
