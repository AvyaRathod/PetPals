//
//  ServiceProviderListingView.swift
//  PetPals
//
//  Created by Avya Rathod on 28/01/24.
//

import SwiftUI
import MapKit

struct ServiceProviderListingView: View {
    
    let results: Pal
    @State private var isEditPressed = false
    
    var body: some View {
        VStack{
            ScrollView{
                ImageCarouselView()

                HStack(){
                    Image("profilepic-1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text(results.name)
                            .fontWeight(.semibold)
                            .font(.title)
                        StarRatingView(rating: 4) // Example rating
                        
                        // Contact and Social Media Links
                        HStack(spacing:25) {
                            Button(action: { callPhone() }) {
                                Image(systemName: "phone.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                            }
                            
                            Button(action: { openWhatsApp() }) {
                                Image("whatsapp icon") // Your custom Instagram icon
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                            }
                            
                            Button(action: { openInstagram() }) {
                                Image("Instagram icon") // Your custom WhatsApp icon
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                            }
                        }.padding(.vertical,6)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical,5)
                Divider()
                
                
                VStack(alignment: .leading){
                    Text("Summary")
                        .font(.title3)
                        .fontWeight(.bold)
                    Text(results.summary)
                        .fontWeight(.light)
                        .padding(.horizontal)
                    Divider()
                    
                    // Services Provided and Price Descriptions Section
                    VStack(alignment: .leading) {
                        Text("Services Provided")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        ForEach(results.servicesOffered, id: \.name) { service in
                            VStack(alignment: .leading) {
                                Text(service.name.rawValue)
                                    .fontWeight(.bold)
                                Text(service.description)
                                    .padding(.bottom, 1)
                                Text(service.price)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.vertical, 2)
                            .padding(.horizontal)
                        }
                    }
                    Divider()
                    
                    Text("Accepted Pets")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    ForEach(results.acceptedPets, id: \.self) { pet in
                        Text(pet)
                            .fontWeight(.light)
                            .padding(.horizontal)
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading){
                        Text("Neighbourhood")
                            .font(.title3)
                            .fontWeight(.bold)
                        Map()
                            .frame(height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle(results.name)
        .navigationBarItems(trailing:
                                HStack {
            Button(action: {
                isEditPressed = true
            }){
                Text("Edit")
            }
        }
        )
        .sheet(isPresented: $isEditPressed){
            ServiceProviderEditInfo()
        }
    }
}

struct ServiceProviderListingView_Previews: PreviewProvider {
    @State static var mockDestination: String = "Guduvancheri, India"
    @State static var mockStartDate: Date = Date()
    @State static var mockEndDate: Date = Date()
    
    static var previews: some View {
        
        ServiceProviderListingView(results: Pal(
            name: "Alice Johnson",
            profileImage: "petimage-1",
            rating: 4,
            address: "123 anywhere st. any city state country 123",
            summary: "I love spending time with furry friends and have a spacious backyard for them to play.",
            servicesOffered: [
                ServicesOffered(name: .dayboarding, description: "Overnight care for your pet", price: "INR 150/Night"),
                ServicesOffered(name: .daycare, description: "Daytime care", price: "INR 100/Day"),
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
        ))
        .environmentObject(UserAuth())
        .environmentObject(BookingManager())
        
        
    }
}
