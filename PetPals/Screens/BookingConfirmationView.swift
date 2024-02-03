//
//  BookingonfirmationView.swift
//  PetPals
//
//  Created by Avya Rathod on 20/01/24.
//

import SwiftUI
import MapKit

struct BookingConfirmationView: View {

    let results: Pal
    
    @Binding var startDate: Date
    @Binding var endDate: Date
    @Binding var startTime: Date
    @Binding var endTime: Date
    @Binding var selectedPets: Set<String>
    @Binding var selectedService: String
    
    init(Bookinginfo: Booking) {
        self.results = Bookinginfo.palBooked
        self._startDate = Binding.constant(Bookinginfo.startDate)
        self._endDate = Binding.constant(Bookinginfo.endDate)
        self._startTime = Binding.constant(Bookinginfo.startTime)
        self._endTime = Binding.constant(Bookinginfo.endTime)
        self._selectedPets = Binding.constant(Bookinginfo.selectedPets)
        self._selectedService = Binding.constant(Bookinginfo.selectedService)
    }

        // Initializing with bindings
    init(results: Pal, startDate: Binding<Date>, endDate: Binding<Date>, startTime: Binding<Date>, endTime: Binding<Date>, selectedPets: Binding<Set<String>>, selectedService: Binding<String>) {
        self.results = results
        self._startDate = startDate
        self._endDate = endDate
        self._startTime = startTime
        self._endTime = endTime
        self._selectedPets = selectedPets
        self._selectedService = selectedService
    }
    
    var body: some View {
        ScrollView{
            VStack {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color.green)
                    .padding(.top, 20)
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
                            Text(results.name)
                                .font(.title)
                                .fontWeight(.bold)
                            
                            
                            Text(results.address)
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
                                .background(Color("Cinnamon"))
                                .cornerRadius(12)
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
                    
                }
                .padding()
                .frame(width:360)
                .background (.white)
                .clipShape (RoundedRectangle (cornerRadius: 12))
                .padding()
                .shadow(radius: 10)
                
                Button(action: {
                        // Action to call the venue
                    }) {
                        Text("Call outlet")
                            .foregroundColor(.white)
                            .frame(width: 250, height: 22)
                            .padding()
                            .background(Color("Cinnamon"))
                            .cornerRadius(12)
                            
                    }
                    .padding(.top)
                
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
                .background(Color.green)
                .cornerRadius(12)
                .padding(.horizontal)
                .padding(.bottom, 20)
                .padding(.top)
                

            }
            .background(Color.white)
        }
        .toolbar(.hidden)
    }
}



struct BookingConfirmationView_Previews: PreviewProvider {
    @State static var mockDestination: String = "Guduvancheri, India"
    @State static var mockStartDate: Date = Date()
    @State static var mockEndDate: Date = Date()
    @State static var selectedService = "walking"
    @State static var selectedPets:Set<String> = ["Tuffy", "Jerry", "Max", "Buddy"]
    
    static var previews: some View {
        NavigationView {
            BookingConfirmationView(results: Pal(
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
        }
    }
}
