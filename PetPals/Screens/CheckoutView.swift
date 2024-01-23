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
    
    @State private var selectedPaymentMethod: String?
    
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
                                ForEach(0..<results.stars, id: \.self) { _ in
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
                        
                        PaymentMethodView(methodName: "Paytm UPI", selectedPaymentMethod: $selectedPaymentMethod)
                        PaymentMethodView(methodName: "Google Pay", selectedPaymentMethod: $selectedPaymentMethod)
                        
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
                        
                    }
                    .padding(.horizontal)
                    
                }
            }
            VStack(alignment: .leading) {
                Divider()
                HStack {
                    Text(totalPrice)
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    Text(taxesAndCharges)
                        .foregroundColor(.secondary)
                }
                .padding([.leading, .trailing, .top])
            }
        }
        .navigationTitle("Final Step")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PaymentMethodView: View {
    var methodName: String
    @Binding var selectedPaymentMethod: String?
    
    var body: some View {
        VStack{
            HStack {
                Text(methodName)
                    .fontWeight(.medium)
                Spacer()
                Image(systemName: selectedPaymentMethod == methodName ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(selectedPaymentMethod == methodName ? .blue : .gray)
            }
            
            if selectedPaymentMethod == methodName {
                NavigationLink(destination:BookingConfirmationView()){
                    Text("Pay via \(methodName)")
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
        .onTapGesture {
            self.selectedPaymentMethod = methodName
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
