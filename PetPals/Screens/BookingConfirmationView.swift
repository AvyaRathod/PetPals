//
//  BookingonfirmationView.swift
//  PetPals
//
//  Created by Avya Rathod on 20/01/24.
//

import SwiftUI

struct BookingConfirmationView: View {

    
    var body: some View {
        ScrollView{
            VStack {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color.green)
                    .padding(.top, 50)
                    .shadow(color:Color.green,radius: 50)
                
                Text("Your Booking is confirmed!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top, 5)
                
                VStack(alignment: .leading, spacing: 10){
                    Text("Confirmed")
                        .fontWeight(.bold)
                        .foregroundColor(Color.green)
                    
                    HStack {
                        VStack(alignment: .leading){
                            Text("results.name")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            
                            Text("results.address")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            // Action for venue location
                        }) {
                            Image(systemName: "map")
                                .foregroundColor(.white)
                                .frame(width:22,height: 22)
                                .padding()
                                .background(Color.orange)
                                .cornerRadius(12)
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
                    
                }
                .padding()
                .frame(width:360)
                .background (.white)
                .clipShape (RoundedRectangle (cornerRadius: 12))
                .padding()
                .shadow(radius: 10)
                
                HStack(spacing: 0.0){
                    Button(action: {
                        // Action to call the venue
                    }) {
                        Text("Call outlet")
                            .foregroundColor(.white)
                            .frame(width: 250, height: 22)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(12)
                            .padding(.horizontal)
                    }
                    .padding(.top, 20)
                    
                    
                }
                
                // Next Steps Section
                VStack(alignment: .leading) {
                    Text("What to do next?")
                        .fontWeight(.bold)
                        .padding(.bottom, 2)
                    
                    Text("Reach at the Pal's on the booked date and time")
                    Text("Don’t forget to pay your bill via the PetPals app for added safety")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.yellow.opacity(0.3))
                .cornerRadius(12)
                .padding(.horizontal)
                .padding(.top, 20)
                
                
                NavigationLink(destination:HomeView()){
                    Text("Done")
                }
                .foregroundColor(.white)
                .frame(width:100)
                .padding()
                .background(Color.red)
                .cornerRadius(12)
                .padding(.horizontal)
                .padding(.bottom, 20)
                
                
                
            }
            .background(Color.white)
        }
        .toolbar(.hidden)
    }
}



struct BookingConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        BookingConfirmationView()
    }
}
