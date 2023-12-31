//
//  UserProfileView.swift
//  PetPals
//
//  Created by user2 on 24/12/23.
//

import SwiftUI

struct UserProfileView: View {
    
    var body: some View {
        NavigationView{
            ScrollView{
                ZStack(){
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color("app_yellow")) // Use the color you want for the rounded rectangle
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
                .offset(y:-80)
                VStack{
                    MyFavTabView()
                        .shadow(radius: 5)
                    
                    Spacer(minLength: 15)
                    
                    RegistrationBoxView()
                        .shadow(radius: 10)
                    VStack{
                        Text("My Pets")
                            .fontWeight(.semibold)
                            .font(.title2)
                            .padding(.top)
                        SelectYourPetsView()
                    }
                    .padding(.horizontal)
                }
                .padding(.top,-430)
            }
        }
    }
}


#Preview {
    UserProfileView()
}
