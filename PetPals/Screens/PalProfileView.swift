//
//  ProfileView.swift
//  PetPals
//
//  Created by user2 on 23/12/23.
//

import SwiftUI
import MapKit

struct PalProfileView: View {
    
    @EnvironmentObject var userAuth: UserAuth
    
    var palName: String
    
    var body: some View {
        VStack{
            ScrollView{
                ImageCarouselView()
                
                
                HStack(){
                    Image("profilepic-1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 54, height: 54)
                        .clipShape(Circle())
                    
                    Text(palName)
                        .fontWeight(.semibold)
                        .font(.title2)
                        .padding()
                    Spacer()
                }
                .padding(.horizontal)
                Divider()
                
                VStack(alignment: .leading){
                    Text("Listing Summary")
                        .fontWeight(.semibold)
                    Text("I'm an undergraduate at SRM University . I'm currently in my 4th year. Being 4th year student I've classes once - twice a week. Making it possible to spend more time with pet.")
                        .fontWeight(.light)
                        .padding(.horizontal)
                    Divider()
                    
                    Text("Number of pets that will be watched at one time")
                        .fontWeight(.semibold)
                    Text("1")
                        .fontWeight(.light)
                        .padding(.horizontal)
                    
                    Divider()
                    
                    Text("Accepted Pets")
                        .fontWeight(.semibold)
                    Text("Cats")
                        .fontWeight(.light)
                        .padding(.horizontal)
                    Text("Dogs")
                        .fontWeight(.light)
                        .padding(.horizontal)
                    Divider()
                    
                    VStack(alignment: .leading){
                        Text("Neighbourhood")
                            .fontWeight(.semibold)
                        Map()
                            .frame(height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                .padding(.horizontal)
            }
            .padding(.bottom,80)
            .overlay(alignment: .bottom){
                VStack{
                    Divider()
                        .padding(.bottom)
                    
                    HStack{
                        VStack(alignment: .leading){
                            Text("Boarding INR 150/Night")
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                        }
                        Spacer()
                        
                        NavigationLink(destination: ConditionalView().environmentObject(userAuth)){
                            Text("Book")
                                .foregroundStyle(.white)
                                .frame(width: 140,height: 40)
                                .background(.appYellow)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                    }
                    .padding(.horizontal)
                }
                .background(.appBrown)
            }
        }
    }
}

#Preview {
    PalProfileView(palName: "palName")
        .environmentObject(UserAuth())

}
