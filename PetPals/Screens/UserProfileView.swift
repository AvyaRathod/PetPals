//
//  UserProfileView.swift
//  PetPals
//
//  Created by user2 on 24/12/23.
//

import SwiftUI

struct UserProfileView: View {
    
    @EnvironmentObject var serviceProvider: ServiceProvider

    
    var body: some View {
        NavigationView{
            ScrollView{
                ZStack(){
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color("Cinnamon")) // Use the color you want for the rounded rectangle
                        .frame(height: 220) // Set the height you want for the rounded rectangle
                    
                    VStack{
                        HStack{
                            VStack(alignment: .leading){
                                Text("John Doe")
                                    .fontWeight(.bold)
                                    .font(.title)
                                
                                HStack(spacing: 2){
                                    Text("+91 9876543210")
                                    Text(" ")
                                    Text("test123@gmail.com")
                                }
                                
                                
                            }
                            Image("profilepic-1")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 54, height: 54)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.top,120)
                    .padding(.horizontal)
                    
                }.offset(y:-25)
                    .padding(.bottom, 360)
                    .edgesIgnoringSafeArea(.top)
                    .offset(y:-60)
            
                VStack{
                    if !serviceProvider.isServiceProvider{
                        RegistrationBoxView()
                    }
                    
                    
                    VStack {
                        OptionsView(title: "My Account", icon: "person.crop.circle")
                        Divider()
                        NavigationLink(destination: FavPalView()){
                            OptionsView(title: "My Pets", icon: "pawprint")
                        }
                        Divider()
                        OptionsView(title: "My Address", icon: "location")
                        Divider()
                        OptionsView(title: "Favourite Pals", icon: "heart")
                        Divider()
                        OptionsView(title: "Help Center", icon: "questionmark.circle")
                        Divider()
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                    .padding(.horizontal))
                    
                    //Booking section
                    
                    
                    
                    
                    //
                    Button("Log Out") {
                        
                    }
                    .frame(width: 360, height: 40, alignment: .center)
                    .background(.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    
                }
                .padding(.top,-430)
            }
        }
    }
}



#Preview {
    UserProfileView()
        .environmentObject(ServiceProvider())

}
