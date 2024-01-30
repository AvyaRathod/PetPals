//
//  ProfileView.swift
//  PetPals
//
//  Created by Avya Rathod on 26/1/24.
//

import SwiftUI
import MapKit
import UIKit

func callPhone() {
    if let url = URL(string: "tel://1234567890"), UIApplication.shared.canOpenURL(url) {
        print("Call Button clicked")
            UIApplication.shared.open(url)
        
        } else {
            print("Call cant be made")

            // Handle the error: The phone call can't be made or the number is invalid.
        }
}

func openInstagram() {
    // Open Instagram URL
}

func openWhatsApp() {
    // Open WhatsApp URL
}

struct PalProfileView: View {
    
    @EnvironmentObject var userAuth: UserAuth
    @EnvironmentObject var userBooking: BookingManager
    
    let results: Pal
    
    @State private var isFavorite: Bool = false
    @State private var isShareButtonPressed = false
    
    let services: [ServicesOffered] = [
        ServicesOffered(name: .dayboarding, description: "Overnight care for your pet", price: "INR 150/Night"),
        ServicesOffered(name: .daycare, description: "Daytime care", price: "INR 100/Day"),
        // Add more services as needed
    ]
    
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
                    Text("I'm an undergraduate at SRM University . I'm currently in my 4th year. Being 4th year student I've classes once - twice a week. Making it possible to spend more time with pet.")
                        .fontWeight(.light)
                        .padding(.horizontal)
                    Divider()
                    
                    // Services Provided and Price Descriptions Section
                    VStack(alignment: .leading) {
                        Text("Services Provided")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        ForEach(services, id: \.name) { service in
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
                    Text("Cats")
                        .fontWeight(.light)
                        .padding(.horizontal)
                    Text("Dogs")
                        .fontWeight(.light)
                        .padding(.horizontal)
                    Divider()
                    
                    VStack(alignment: .leading){
                        Text("Neighbourhood")
                            .font(.title3)
                            .fontWeight(.bold)
                        Map()
                            .frame(height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    Divider()
                    
                    VStack(alignment: .leading, spacing: -20){
                        Text("Reviews")
                            .font(.title3)
                            .fontWeight(.bold)
                        ReviewsView()
                    }
                }
                .padding(.horizontal)
            }
            VStack{
                Divider()
                    .padding(.bottom)
                
                HStack{
                    VStack(alignment: .leading){
                        Text("Services starting from ₹150")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                    }
                    Spacer()
                    
                    NavigationLink(destination: RequestView(results: results).environmentObject(userAuth)
                        .environmentObject(userBooking)){
                            Text("Book")
                                .foregroundStyle(.white)
                                .frame(width: 140,height: 40)
                                .background(.appYellow)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                }
                .padding(.horizontal)
            }
            .background(.appBrown)
            
        }
        .navigationTitle(results.name)
        .navigationBarItems(trailing:
                                HStack {
            Button(action: {
                isFavorite.toggle()
            }) {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(isFavorite ? .red : .gray)
            }
            
            Button(action: {
                isShareButtonPressed.toggle()
            }){
                Image(systemName: "square.and.arrow.up")
                    .foregroundColor(.gray)
            }
        }
        )
    }
}

struct PalProfileView_Previews: PreviewProvider {
    @State static var mockDestination: String = "Guduvancheri, India"
    @State static var mockStartDate: Date = Date()
    @State static var mockEndDate: Date = Date()
    
    static var previews: some View {
        
        PalProfileView(results: Pal(
            name: "Alice Johnson",
            profileImage: "petimage-1",
            rating: 4,
            address: "123 anywhere st. any city state country 123",
            summary: "I love spending time with furry friends and have a spacious backyard for them to play.",
            servicesOffered: [
                ServicesOffered(name: .dayboarding, description: "Safe and caring overnight stay", price: "INR 200/Night"),
                ServicesOffered(name: .daycare, description: "Fun-filled daytime care", price: "INR 150/Day")
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
