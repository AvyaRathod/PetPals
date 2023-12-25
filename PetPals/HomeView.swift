//
//  HomeView.swift
//  PetPals
//
//  Created by Avya Rathod on 09/12/23.
//

import SwiftUI

struct HomeView: View {
    
    let gradient = LinearGradient(
        gradient: Gradient(colors: [Color("app_brown"), Color.white]),
        startPoint: .top,
        endPoint: UnitPoint(x: 0.5, y: 2)
    )
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    // Search Bar
                    TextField("Search", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        
                    
                    // Services Offered Section
                    Text("Services offered")
                        .font(.headline)
                        .foregroundColor(.white) // Text color set to white
                        .padding(.leading)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ServiceView(serviceName: "Boarding")
                            ServiceView(serviceName: "Daycare")
                            ServiceView(serviceName: "Sitting")
                            ServiceView(serviceName: "Walking")
                        }
                    }
                    
                    // Pals Nearby Section
                    HStack {
                        Text("Pals nearby")
                            .font(.headline)
                            .foregroundColor(.white) // Text color set to white
                        
                        Spacer()
                        
                        NavigationLink(destination: PalsNearbyView()) {
                            Text("View All")
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                                .background(Color("app_yellow"))
                                .foregroundColor(.white)
                                .cornerRadius(15)
                        }
                    }
                    .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            PalView(palName: "Jack Bird", palPets: "Dogs, Cats", imageName: "userimage")
                            PalView(palName: "Rimi Lan", palPets: "Dogs, Cats",imageName: "userimage")
                            PalView(palName: "Rimi Lan", palPets: "Dogs, Cats",imageName: "userimage")
                        }
                    }
                    .padding(.horizontal)
                    
                    // Pets in the Community Section
                    HStack {
                        Text("Pets nearby")
                            .font(.headline)
                            .foregroundColor(Color.white)
                        
                        Spacer()
                        
                        // Rounded Button
                        Button(action: {
                            // Action for the button
                        }) {
                            Text("View All")
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                                .background(Color("app_yellow"))
                                .foregroundColor(.white)
                                .cornerRadius(15)
                        }
                    }
                    .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            PetView(petName: "Tuffy", imageName: "Dogs")
                            PetView(petName: "Jerry", imageName: "Dogs")
                            PetView(petName: "Oreo", imageName: "Dogs")
                        }
                    }
                    .padding(.horizontal)
                    
                    // Become a Sitter Banner
                    ZStack {
                        // Background image
                        Image("sitter-banner-background") // Replace with your actual image name
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 0.5)
                            )
                        
                        // Text and button overlay
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Become a Sitter")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Text("Earn extra income and unlock new opportunities by sharing your space and love for pets")
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                            
                            Button(action: {
                                // Action for learn more button
                            }) {
                                Text("Learn more")
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.black.opacity(0.7))
                                    .cornerRadius(10)
                            }
                        }
                        .padding()
                        .background(Color.black.opacity(0.3))
                        .cornerRadius(10)
                    }
                    .padding()
                    
                }
            }
            .background(gradient)
            .navigationTitle("PetPals")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
            }) {
                Image(systemName: "person.crop.circle")
                    .accentColor(Color("util_grey"))
            })
            .accentColor(Color("util_grey")) // the title is not getting grey??
        }
    }
}

//delete this below struct and attach it to pals nearby fitered according to the service
struct ServiceDetailsView: View {
    var serviceName: String

    var body: some View {
        Text("\(serviceName) Details")
            .navigationTitle(serviceName)
    }
}

struct ServiceView: View {
    var serviceName: String
    
    var body: some View {
        NavigationLink(destination: ServiceDetailsView(serviceName: serviceName)) {
            VStack {
                // Service Image Placeholder
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 60, height: 60)
                    .foregroundColor(.gray)
                
                Text(serviceName)
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
        }
        .padding()
        .buttonStyle(PlainButtonStyle())
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
