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
        NavigationLink(destination: PetProfileView(petName: petName)) {
            VStack(alignment: .leading, spacing: 0) {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 180)
                    .clipped()
                    .cornerRadius(8)
                    .shadow(radius: 15)
                    
                
                Text(petName)
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding([.vertical], 4)
                    .lineLimit(1)
                    .padding(.bottom)
            }
            .frame(width: 150, height: 190)
            .background(Color.clear)
            .cornerRadius(8)
            
        }
    }
}

struct PetProfileView: View {
    var petName: String

    var body: some View {
        Text("Profile of \(petName)'s pet")
            .navigationTitle(petName)
    }
}

#Preview {
    PetView(petName: "Haley Manal", imageName: "p1")
}
