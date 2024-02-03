//
//  HomeView.swift
//  PetPals
//
//  Created by Avya Rathod on 09/12/23.
//

import SwiftUI
import MapKit

struct HomeView: View {
    
    @EnvironmentObject var serviceProvider: ServiceProvider
    @EnvironmentObject var userBooking: BookingManager
    
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
                    ServiceView(serviceName: "Boarding", serviceImage: "p16")
                    ServiceView(serviceName: "Daycare", serviceImage: "p14")
                    ServiceView(serviceName: "Sitting", serviceImage: "p17")
                    ServiceView(serviceName: "Walking", serviceImage: "p15")
                }
                // My bookings
                if userBooking.bookings.count > 0 {
                    
                    HStack {
                        Text("My bookings")
                            .font(.headline)
                            .foregroundColor(.black) // Text color set to white
                        
                        Spacer()
                        
                        if userBooking.bookings.count > 1{
                            NavigationLink(destination: CurrentBookingsView()) {
                                HStack(spacing: 6.0) {
                                    Text("View All")
                                        .foregroundColor(.white)
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.white)
                                    
                                }
                                .padding(6.0)
                            }
                            .background(Color("Cinnamon"))
                            .cornerRadius(15)
                        }
                    }
                    .padding(.horizontal)
                    if let firstBooking = userBooking.bookings.first {
                        UserBookingPlaccard(booking: firstBooking)
                    }
                }
                
//                // Pals Nearby Section
                HStack {
                    Text("Favourites")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.primary)
                    
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
                    .background(Color("Cinnamon"))
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
                if !serviceProvider.isServiceProvider{
                    becomeASitterBanner()
                        
                }
                    
                
                // explore section
                VStack(alignment: .leading) {
                    // Title
                    Text("\(palsArray.count) pals to explore")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.primary)
                        .padding(.leading)
                    
                    // Filter and Sort Menus
                    HStack {
                        Menu {
                            Button("Cost", action: { /* Apply cost filter */ })
                            Button("Distance", action: { /* Apply distance filter */ })
                        } label: {
                            Label("Filter", systemImage: "line.horizontal.3.decrease.circle")
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                                .background(Color("Cinnamon"))
                                .foregroundColor(.white)
                                .cornerRadius(15)
                        }
                        
                        Menu {
                            Button("Cost", action: { /* Apply cost filter */ })
                            Button("Distance", action: { /* Apply distance filter */ })
                        } label: {
                            Label("Sort", systemImage: "arrow.up.arrow.down")
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                                .background(Color("Cinnamon"))
                                .foregroundColor(.white)
                                .cornerRadius(15)
                        }
                        Spacer()
                    }
                    .padding(.bottom,4)
                    .padding(.leading)
                                        
                    // Pal List
                    LazyVStack(spacing: 18) {
                        ForEach(palsArray) { pal in
                            BookingPlacard(results: pal)
                                .environmentObject(userBooking)
                        }
                    }
                }
            }
        }
        .background(Color.white.opacity(0.9))
        .navigationTitle("PetPals")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: NavigationLink(destination: UserProfileView()){
            Image(systemName: "person.crop.circle")
                .accentColor(Color.black)
        })
        .navigationBarBackButtonHidden(true)
    }
}


struct ServiceView: View {
    var serviceName: String
    var serviceImage: String
    var body: some View {
        NavigationLink(destination: PalsNearbyView(serviceName: serviceName)) {
            VStack {
                // Service Image Placeholder
                Image(serviceImage)
                
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                
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
            .environmentObject(ServiceProvider())
            .environmentObject(BookingManager())

    }
}
#endif
