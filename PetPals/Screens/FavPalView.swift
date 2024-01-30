//
//  FavPalView.swift
//  PetPals
//
//  Created by user2 on 02/01/24.
//

import SwiftUI

struct FavPalView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.yellow.opacity(1)) // Use the color you want for the rounded rectangle
                .frame(height: 220) // Set the height you want for the rounded rectangle
            
           
            VStack(){
                        Text("Favourite Pals")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundStyle(.white)
            }
            .padding(.top, 80)
        }
        .edgesIgnoringSafeArea(.top)
        .offset(y:-80)
        ScrollView{
           Text("Add Your Favourite Pals")
            
        }
    }
}

#Preview {
    FavPalView()
}
