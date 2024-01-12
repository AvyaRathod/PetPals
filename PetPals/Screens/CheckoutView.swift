//
//  CheckoutView.swift
//  PetPals
//
//  Created by Avya Rathod on 11/01/24.
//

import SwiftUI

struct CheckoutView: View {
    
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
    
    @State private var selectedPaymentMethod: String? = "Google Pay"
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                // Property Details
                VStack(alignment: .leading) {
                    Text(propertyName)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(propertyAddress)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    
                    HStack {
                        ForEach(0..<5) { _ in
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
                        Text(checkInDate)
                            .fontWeight(.bold)
                    }
                    Spacer()
                    Divider()
                        .frame(height: 50.0)
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("To")
                        Text(checkOutDate)
                            .fontWeight(.bold)
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
                        Text(price)
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
                                    
                                    PaymentMethodView(methodName: "Paytm UPI", selectedPaymentMethod: $selectedPaymentMethod)
                                    PaymentMethodView(methodName: "Google Pay", selectedPaymentMethod: $selectedPaymentMethod)
                                    
                                    if selectedPaymentMethod == "Google Pay" {
                                        Button("PAY VIA GOOGLEPAY") {
                                            // Implement the Google Pay action
                                        }
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.green)
                                        .cornerRadius(10)
                                        .padding(.horizontal)
                                    }
                                    
                                    PaymentMethodView(methodName: "Pay on Delivery (Cash/UPI)", selectedPaymentMethod: $selectedPaymentMethod)
                                    
                                    Text("Pay by any UPI App")
                                        .font(.headline)
                                        .padding(.top)
                                    
                                    VStack {
                                        PaymentMethodView(methodName: "tejasragupathi@okhdfcbank", selectedPaymentMethod: $selectedPaymentMethod)
                                        PaymentMethodView(methodName: "omvin@aubank", selectedPaymentMethod: $selectedPaymentMethod)
                                        
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
    private func selectPaymentMethod(_ method: String) {
        selectedPaymentMethod = method
    }
}
    
    
struct PaymentMethodView: View {
    var methodName: String
    @Binding var selectedPaymentMethod: String?

    var body: some View {
        HStack {
            Text(methodName)
                .fontWeight(.medium)
            Spacer()
            Image(systemName: selectedPaymentMethod == methodName ? "checkmark.circle.fill" : "circle")
                .foregroundColor(selectedPaymentMethod == methodName ? .blue : .gray)
                .onTapGesture {
                    // This will set this method as the selected method
                    selectedPaymentMethod = methodName
                }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor.systemGray6)))
        .contentShape(Rectangle()) // Make the whole row tappable
        .onTapGesture {
            // This will set this method as the selected method
            selectedPaymentMethod = methodName
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckoutView()
        }
    }
}
