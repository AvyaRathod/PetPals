//
//  BookingPlacard.swift
//  PetPals
//
//  Created by Avya Rathod on 25/12/23.
//

import SwiftUI

struct Results: Identifiable {
    let id = UUID()
    let img: String?
    let name: String
    let stars: Int?
    let address: String
    let cost: String
}

struct BookingPlacard: View {
    let results: Results

    @EnvironmentObject var userBooking: BookingManager

    @State private var isFavorite: Bool = false
    
    var body: some View {
        NavigationLink(destination: PalProfileView(results: results,palName: results.name).environmentObject(userBooking)) {
            ZStack(alignment: .topTrailing) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .frame(width: 364, height: 167)
                    .overlay(
                        VStack {
                            HStack {
                                Image(results.img!)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 112, height: 144)
                                    .clipped()
                                    .cornerRadius(10)
                                    .offset(x:-8)
                                VStack {
                                    VStack(alignment: .leading) {
                                        Text(results.name)
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                        
                                        HStack {
                                            ForEach(0..<results.stars!, id: \.self) { _ in
                                                Image(systemName: "star.fill")
                                                    .foregroundColor(.yellow)
                                                    .frame(width: 12.0)
                                                
                                            }
                                        }
                                        Text(results.address)
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                            .lineLimit(2)
                                    }
                                    VStack(alignment: .trailing) {
                                        Text("From INR \(results.cost)/night")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                        
                                        //add conditional routing here: if already logged in, lead to a confirmation page-> payment options-> booking successful/failed page
                                        
                                        // if you want to give the book button on the placcard
                                        
//                                        NavigationLink(destination: ConditionalView(results: Results(img: results.img,
//                                                                                                     name: results.name,
//                                                                                                     stars: results.stars,
//                                                                                                     address: results.address,
//                                                                                                     cost: results.cost)).environmentObject(userAuth)) {                                            Text("Book")
//                                                .foregroundColor(.white)
//                                                .padding()
//                                                .frame(width: 179.0, height: 23.0)
//                                                .background(Color.brown)
//                                                .cornerRadius(10)
//                                        }
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

// Preview
struct BookingPlacard_Previews: PreviewProvider {
   
    static var previews: some View {
        BookingPlacard(results: Results(img: "petimage-1",
                                        name: "Rimi Lan",
                                        stars: 5,
                                        address: "123 anywhere st. any city state country 123",
                                        cost: "150"))
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color(white: 0.9))
            .environmentObject(UserAuth())
    }
}
