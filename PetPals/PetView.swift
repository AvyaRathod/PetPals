//
//  PetView.swift
//  PetPals
//
//  Created by Avya Rathod on 16/12/23.
//

import SwiftUI

struct PetView: View {
    var petName: String
    var imageName: String
    
    var body: some View {
        NavigationLink(destination: PetProfileView(petOwnerName: petName)) {
            VStack(alignment: .leading, spacing: 0) {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .clipped()
                    .cornerRadius(8)
                
                Text(petName)
                    .font(.headline)
                    .foregroundColor(.white) 
                    .padding([.horizontal], 8)
                    .lineLimit(1)
            }
            .frame(width: 150, height: 190)
            .background(Color.clear)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .shadow(radius: 10) // Shadow for the card
        }
    }
}

struct PetProfileView: View {
    var petOwnerName: String

    var body: some View {
        Text("Profile of \(petOwnerName)'s pet")
            .navigationTitle(petOwnerName)
    }
}

#Preview {
    PetView(petName: "Haley Manal", imageName: "Dogs")
}
