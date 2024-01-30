//
//  BookingPlacard.swift
//  PetPals
//
//  Created by Avya Rathod on 25/12/23.
//

import SwiftUI
import MapKit

struct BookingPlacard: View {
    let results: Pal

    @EnvironmentObject var userBooking: BookingManager

    @State private var isFavorite: Bool = false
    
    var body: some View {
        NavigationLink(destination: PalProfileView(results: results).environmentObject(userBooking)) {
            ZStack(alignment: .topTrailing) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .frame(width: 364, height: 167)
                    .shadow(radius: 8)
                    .overlay(
                        VStack {
                            HStack {
                                Image(results.profileImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 112, height: 144)
                                    .clipped()
                                    .cornerRadius(10)
                                    .offset(x:-8)
                                VStack {
                                    VStack(alignment: .leading) {
                                        Text(results.name)
                                            .font(.title3)
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                        
                                        HStack {
                                            StarRatingView(rating: results.rating)
                                        }
                                        Text(results.address)
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                            .lineLimit(2)
                                    }
                                    VStack(alignment: .trailing) {
                                        Text("Services starting from \(results.minCost(pal: results))")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                    .offset(x:13,y:10)
                                    
                                }
                            }
                        }
                    )
                
                // Favorite button
                Button(action: {
                    isFavorite.toggle()
                }) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(isFavorite ? .red : .gray)
                        .padding(10)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
                .offset(x: -1, y: 4)
            }
            .padding(.horizontal)
        }
    }
}

struct StarRatingView: View {
    let rating: Int

    var body: some View {
        HStack {
            ForEach(0..<5, id: \.self) { star in
                Image(systemName: star < rating ? "star.fill" : "star")
                    .foregroundColor(star < rating ? .yellow : .gray)
            }
        }
    }
}

// Preview
struct BookingPlacard_Previews: PreviewProvider {
    
    static var previews: some View {
        BookingPlacard(results: Pal(
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
        )
        )
        .previewLayout(.sizeThatFits)
        .padding()
        .background(Color.white)
        .environmentObject(UserAuth())
        .environmentObject(BookingManager())
        
    }
}
