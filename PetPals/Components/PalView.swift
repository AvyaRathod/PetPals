//
//  OnboardingView.swift
//  PetPals
//
//  Created by Avya Rathod on 16/12/23.
//

import SwiftUI

struct PalView: View {
    var palName: String
    var palPets: String
    var imageName: String
    @State private var isFavorite: Bool = false
    
    var body: some View {
//        NavigationLink(destination: PalProfileView(palName: palName)) {
            VStack(alignment: .leading, spacing: 0) {
                ZStack(alignment: .topTrailing) {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipped()
                        .cornerRadius(8)
                        .shadow(radius:10)

                    
                    Button(action: {
                        isFavorite.toggle()
                    }) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(isFavorite ? .red : .white)
                            .padding(8)
                            .background(Color.black.opacity(0.2))
                            .clipShape(Circle())
                        
                    }
                    .offset(x: -5, y: 10)
                }
                
                VStack(alignment: .leading, spacing: 0){
                    Text(palName)
                        .font(.headline)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    Text(palPets)
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .lineLimit(1)
                }.padding([.vertical],3)
            }
            .frame(width: 150, height: 190)
            .background(Color.clear)
            .cornerRadius(8)
            
//        }
    }
}

// Preview
#Preview {
    PalView(palName: "Lorem ipsun", palPets: "Dog, cat", imageName: "p11")
        .previewLayout(.sizeThatFits)
                    .padding()
}
