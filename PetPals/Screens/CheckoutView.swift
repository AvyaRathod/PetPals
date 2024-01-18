//
//  CheckoutView.swift
//  PetPals
//
//  Created by Avya Rathod on 11/01/24.
//

import SwiftUI

struct CheckoutView: View {
    
    let results: Results
    
    @Binding var startDate: Date
    @Binding var endDate: Date
    @Binding var startTime: Date
    @Binding var endTime: Date
    
    let propertyName = "Grand Mainguet"
    let propertyRating = 9.0
    let propertyAddress = "Le Grand Mainguet, Saint-Lambert-la-Potherie, 49070, France"
    let checkInDate = "Fri, 12 Jan 2024"
    let checkOutDate = "Sat, 13 Jan 2024"
    let guests = "2 adults"
    let price = "₹ 7,725.66"
    let taxesAndCharges = "₹ 136"
    let propertyCurrencyPrice = "€ 85.00"
    let totalPrice = "₹ 7,726"
        
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                // Property Details
                VStack(alignment: .leading) {
                    Text(results.name)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(results.address)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    
                    HStack {
                        ForEach(0..<results.stars, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                    }
                }
                .padding()
                
                Divider()
                
                // Booking Details
                HStack {
                    VStack(alignment: .leading) {
                        Text("From")
//                        Text(startDate)
//                            .fontWeight(.bold)
//                        Text(startTime)
//                            .fontWeight(.bold)
                    }
                    Spacer()
                    Divider()
                        .frame(height: 50.0)
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("To")
//                        Text(endDate)
//                            .fontWeight(.bold)
//                        Text(endTime)
//                            .fontWeight(.bold)
                    }
                }
                .padding([.leading, .trailing])
                
                Divider()
                
                // Guests
                HStack {
                    Text("Pets")
                    Spacer()
                    Text("pet names")
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
                        Text(results.cost)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    .padding([.leading, .trailing, .top])
                    
                    HStack {
                        Text("Taxes")
                            .foregroundColor(.secondary)
                        Spacer()
                        Text(taxesAndCharges)
                            .foregroundColor(.secondary)
                    }
                    .padding([.leading, .trailing])
                }
                
                Divider()
                
                // Payment options
                
                VStack(alignment: .leading, spacing: 20) {
                                    Text("Payment Options")
                                        .font(.headline)
                                        .padding(.bottom, 5)
                                    
                                    PaymentMethodView(methodName: "Paytm UPI")
                                    PaymentMethodView(methodName: "Google Pay")
                                    
                                    PaymentMethodView(methodName: "Pay on Delivery (Cash/UPI)")
                                    
                                    Text("Pay by any UPI App")
                                        .font(.headline)
                                        .padding(.top)
                                    
                                    VStack {
                                        PaymentMethodView(methodName: "tejasragupathi@okhdfcbank")
                                        PaymentMethodView(methodName: "omvin@aubank")
                                        
                                        Button("Add New UPI ID") {
                                            // Implement the Add New UPI action
                                        }
                                        .foregroundColor(.blue)
                                    }
                                    
                                    Text("Credit & Debit Cards")
                                        .font(.headline)
                                        .padding(.top)
                                    
                                    // Add views for credit & debit card options here
                                }
                                .padding(.horizontal)
    
                Divider()
                // Total Price and Button
                VStack(alignment: .leading) {
                    HStack {
                        Text(totalPrice)
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                        Text(taxesAndCharges)
                            .foregroundColor(.secondary)
                    }
                    .padding([.leading, .trailing, .top])
                    
                    Button(action: {
                        // Final step action
                    }) {
                        Text("Final step")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
            .navigationTitle("Final Step")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

private func dateRangeString(from startDate: Date, to endDate: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "d MMM" // e.g., 30 Nov
    
    let startDateString = dateFormatter.string(from: startDate)
    let endDateString = dateFormatter.string(from: endDate)
    
    return "\(startDateString) - \(endDateString)"
    
}
    
    
struct PaymentMethodView: View {
    var methodName: String
    
    @State private var selectedPaymentMethod = ""


    var body: some View {
        HStack {
            Text(methodName)
                .fontWeight(.medium)
            Spacer()
            Image(systemName: selectedPaymentMethod == methodName ? "checkmark.circle.fill" : "circle")
                .foregroundColor(selectedPaymentMethod == methodName ? .blue : .gray)
            
            if selectedPaymentMethod == methodName {
                Button("Pay via \(selectedPaymentMethod)") {
                    // Implement the Google Pay action
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .cornerRadius(10)
                .padding(.horizontal)
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor.systemGray6)))
        .contentShape(Rectangle())
        .onTapGesture {
            selectedPaymentMethod = methodName
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    @State static var mockDestination: String = "Guduvancheri, India"
    @State static var mockStartDate: Date = Date()
    @State static var mockEndDate: Date = Date()
    
    static var previews: some View {
        NavigationView {
            CheckoutView(results: Results(img: "petimage-1",
                                          name: "Rimi Lan",
                                          stars: 5,
                                          address: "123 anywhere st. any city state country 123",
                                          cost: "150"),
                         startDate: $mockStartDate, endDate: $mockEndDate, startTime: $mockStartDate, endTime: $mockEndDate)
        }
    }
}
