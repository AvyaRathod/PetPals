//
//  ContentView.swift
//  PetPals
//
//  Created by Avya Rathod on 08/12/23.
//

import SwiftUI

struct ContentView: View {
    let gradient = LinearGradient(
            gradient: Gradient(colors: [Color.red, Color.blue]), // Replace with your desired colors
            startPoint: .top,
            endPoint: .bottom
        )
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                
                VStack(alignment: .leading) {
                    // Search Bar Placeholder
                    Text("Search Bar Placeholder")
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
                    Text("Pals nearby")
                        .font(.headline)
                        .padding(.leading)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            PalView(palName: "Jack Bird", palPets: "Dogs, Cats")
                            PalView(palName: "Rimi Lan", palPets: "Dogs, Cats")
                            PalView(palName: "Rimi Lan", palPets: "Dogs, Cats")
                        }
                    }
                    
                    // Pets in the Community Section
                    Text("Pets in the community")
                        .font(.headline)
                        .padding(.leading)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            PetView(petOwnerName: "Haley Manal", petType: "Dogs")
                            PetView(petOwnerName: "Haley Manal", petType: "Dogs")
                            PetView(petOwnerName: "Haley Manal", petType: "Dogs")
                        }
                    }
                    
                    // Become a Sitter Banner
                    Text("Become a Sitter")
                        .font(.headline)
                        .padding()
                }
            }
            .navigationBarTitle("PetPals", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                // Settings action
            }) {
                Image(systemName: "gear")
            })
        }
    }
}

// Subviews for Services, Pals, and Pets
struct ServiceView: View {
    var serviceName: String
    
    var body: some View {
        VStack {
            // Service Image Placeholder
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 60, height: 60)
                .foregroundColor(.gray)
            
            Text(serviceName)
                .font(.caption)
        }
        .padding()
    }
}

struct PalView: View {
    var palName: String
    var palPets: String
    
    var body: some View {
        VStack {
            // Pal Image Placeholder
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 120, height: 120)
                .foregroundColor(.gray)
            
            Text(palName)
                .font(.headline)
            Text(palPets)
                .font(.subheadline)
        }
        .padding()
    }
}

struct PetView: View {
    var petOwnerName: String
    var petType: String
    
    var body: some View {
        VStack {
            // Pet Image Placeholder
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 120, height: 120)
                .foregroundColor(.gray)
            
            Text(petOwnerName)
                .font(.headline)
            Text(petType)
                .font(.subheadline)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
