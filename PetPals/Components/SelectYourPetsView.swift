//
//  SelectYourPetsView.swift
//  PetPals
//
//  Created by Avya Rathod on 28/12/23.
//

import SwiftUI

struct SelectYourPetsView: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: -20),
        GridItem(.flexible(), spacing: 0)
    ]
    
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20){
                    SelectPetView(petName: "Tuffy", imageName: "Dogs")
                        .padding(.horizontal, 4)
                        .background(.gray)
                        .cornerRadius(8)
                    SelectPetView(petName: "Jerry", imageName: "Dogs")
                        .padding(.horizontal, 4)
                        .background(.gray)
                        .cornerRadius(8)
                    SelectPetView(petName: "Tuffy", imageName: "Dogs")
                        .padding(.horizontal, 4)
                        .background(.gray)
                        .cornerRadius(8)
                    SelectPetView(petName: "Jerry", imageName: "Dogs")
                        .padding(.horizontal, 4)
                        .background(.gray)
                        .cornerRadius(8)
                    AddAnimal(petName: "Add Animal", imageName: "None")
                        .padding(.horizontal, 4)
                        .background(.gray)
                        .cornerRadius(8)
                }
            }
        }
    }
}

struct SelectPetView: View {
    var petName: String
    var imageName: String
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading,spacing: -30) {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 130, height: 170)
                    .clipped()
                    .cornerRadius(8)
                
                Text(petName)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal,8)
                    .lineLimit(1)
                    .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            }
            .frame(width: 130, height: 170)
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

struct AddAnimal: View {
    var petName: String
    var imageName: String
    
    var body: some View {
        NavigationLink(destination: AddAnimalView()){
            ZStack{
                VStack(alignment: .leading,spacing: -30) {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 130, height: 170)
                        .clipped()
                        .cornerRadius(8)
                    
                    Text("Add new pet")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal,8)
                        .lineLimit(1)
                        .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                }
                .frame(width: 130, height: 170)
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
}

#Preview {
    SelectYourPetsView()
}
