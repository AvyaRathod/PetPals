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

                        Spacer()

                        Button(action: {
                            // Action for the button
                        }) {
                            Text("View All")
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            PalView(palName: "Jack Bird", palPets: "Dogs, Cats")
                            PalView(palName: "Rimi Lan", palPets: "Dogs, Cats")
                            PalView(palName: "Rimi Lan", palPets: "Dogs, Cats")
                        }
                    }
                    
                    // Pets in the Community Section
                    HStack {
                        Text("Pets nearby")
                            .font(.headline)
                        
                        Spacer()
                        
                        // Rounded Button
                        Button(action: {
                            // Action for the button
                        }) {
                            Text("View All")
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                                .background(Color.blue) // change color
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            PetView(petOwnerName: "Haley Manal", petType: "Dogs")
                            PetView(petOwnerName: "Haley Manal", petType: "Dogs")
                            PetView(petOwnerName: "Haley Manal", petType: "Dogs")
                        }
                    }
                    
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
                // Settings action
            }) {
                Image(systemName: "person.crop.circle")
                    .opacity(/*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/)
            })
        }
    }
}

// Subviews for Services, Pals, and Pets
struct ServiceDetailView: View {
    var serviceName: String

    var body: some View {
        Text("\(serviceName) Details")
            .navigationTitle(serviceName)
    }
}

struct ServiceView: View {
    var serviceName: String
    
    var body: some View {
        NavigationLink(destination: ServiceDetailView(serviceName: serviceName)) {
            VStack {
                // Service Image Placeholder
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 60, height: 60)
                    .foregroundColor(.gray)
                
                Text(serviceName)
                    .font(.caption)
                    .foregroundColor(.black)
            }
        }
        .padding()
        .buttonStyle(PlainButtonStyle())
    }
}

struct PalProfileView: View {
    var palName: String

    var body: some View {
        Text("Profile of \(palName)")
            .navigationTitle(palName)
    }
}

struct PetProfileView: View {
    var petOwnerName: String

    var body: some View {
        Text("Profile of \(petOwnerName)'s pet")
            .navigationTitle(petOwnerName)
    }
}

struct PalView: View {
    var palName: String
    var palPets: String

    var body: some View {
        NavigationLink(destination: PalProfileView(palName: palName)) {
            VStack {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 120, height: 120)
                    .foregroundColor(.gray)

                Text(palName)
                    .font(.headline)
                Text(palPets)
                    .font(.subheadline)
            }
            .foregroundColor(.black)
        }
        .padding()
    }
}

struct PetView: View {
    var petOwnerName: String
    var petType: String

    var body: some View {
        NavigationLink(destination: PetProfileView(petOwnerName: petOwnerName)) {
            VStack {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 120, height: 120)
                    .foregroundColor(.gray)

                Text(petOwnerName)
                    .font(.headline)
                Text(petType)
                    .font(.subheadline)
            }
            .foregroundColor(.black)
        }
        .padding()
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
