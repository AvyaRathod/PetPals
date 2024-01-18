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
                    
                    // explore section
                    VStack(alignment: .leading) {
                        Text("12 pals to explore")
                            .font(.headline)
                            .foregroundColor(Color.black)
                        Divider()
                            .frame(width: 200.0)
                        
                        ScrollView {
                            LazyVStack(spacing: 8) {
                                ForEach(0..<10) { index in // Replace with actual data source
                                    BookingPlacard(results: Results(img: "petimage-1",
                                                                    name: "Rimi Lan",
                                                                    stars: 5,
                                                                    address: "123 anywhere st. any city state country 123",
                                                                    cost: "150"))
                                    
                                    Divider()
                                }
                            }
                        }
                    }.padding()
                    
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
