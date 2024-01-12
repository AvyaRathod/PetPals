//
//  HomeView.swift
//  PetPals
//
//  Created by Avya Rathod on 09/12/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var searchText = ""
    
    var body: some View {
            ScrollView {
                VStack(alignment: .leading) {
                    // Search Bar
                    TextField("Search Pets, Pals, Services ... ", text: $searchText)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        
                    // Services Offered Section
                    Text("Services offered")
                        .font(.headline)
                        .foregroundColor(.black) // Text color set to white
                        .padding(.leading)
                    
                        HStack {
                            ServiceView(serviceName: "Boarding")
                            ServiceView(serviceName: "Daycare")
                            ServiceView(serviceName: "Sitting")
                            ServiceView(serviceName: "Walking")
                        }
                    
                    // Pals Nearby Section
                    HStack {
                        Text("Pals nearby")
                            .font(.headline)
                            .foregroundColor(.black) // Text color set to white
                        
                        Spacer()
                        
                        NavigationLink(destination: PalsNearbyView(serviceName: "None")) {
                            HStack(spacing: 6.0) {
                                Text("View All")
                                    .foregroundColor(.white)
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)

                            }
                            .padding(6.0)
                        }
                        .background(Color("app_yellow"))
                        .cornerRadius(15)
                    }
                    .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            PalView(palName: "Jack Bird", palPets: "Dogs, Cats", imageName: "p1")
                            PalView(palName: "Rimi Lan", palPets: "Dogs, Cats",imageName: "p2")
                            PalView(palName: "Rimi Lan", palPets: "Dogs, Cats",imageName: "p3")
                        }
                    }
                    .padding(.horizontal)
                    
                    // Pets in the Community Section
                    HStack {
                        Text("Pets nearby")
                            .font(.headline)
                            .foregroundColor(Color.black)
                        
                        Spacer()
                        
                    }
                    .padding(.horizontal, 17.0)
                    .padding(.vertical, 7.0)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            PetView(petName: "Tuffy", imageName: "p10")
                            PetView(petName: "Jerry", imageName: "p6")
                            PetView(petName: "Oreo", imageName: "p12")
                        }
                    }
                    .padding(.horizontal)
                    
                    // Become a Sitter Banner
                    ZStack {
                        // Background image
                        Image("p11")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .cornerRadius(10)
                        
                        // Text and button overlay
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Become a Sitter")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Text("Earn extra income and unlock new opportunities by sharing your space and love for pets")
                                .foregroundColor(.black)
                                .padding(.bottom, 20)
                            
                            NavigationLink(destination: UserProfileView()){
                                Text("Learn more")
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.appYellow)
                                    .cornerRadius(10)
                            }
                        }
                        .padding()
                        .cornerRadius(10)
                    }
                    .padding()
                    
                }
            }
            .navigationTitle("PetPals")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: NavigationLink(destination: UserProfileView()){
                Image(systemName: "person.crop.circle")
                    .accentColor(Color.black)
            })
        }
    }


struct ServiceView: View {
    var serviceName: String
    
    var body: some View {
        NavigationLink(destination: PalsNearbyView(serviceName: serviceName)) {
            VStack {
                // Service Image Placeholder
                RoundedRectangle(cornerRadius: 800)
                    .frame(width: 65, height: 65)
                    .foregroundColor(.gray)
                
                Text(serviceName)
                    .font(.subheadline)
                    .foregroundColor(.black)
            }
        }
        .padding(14)
        .buttonStyle(PlainButtonStyle())
        .shadow(radius: 5)
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
