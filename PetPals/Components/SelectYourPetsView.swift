//
//  SelectYourPetsView.swift
//  PetPals
//
//  Created by Avya Rathod on 28/12/23.
//

import SwiftUI

struct SelectYourPetsView: View {
    // Sample data - replace this with your data source
    let pets = ["Tuffy", "Jerry", "Max", "Buddy"]
    @State private var selectedPets: Set<String> = []

    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: -20),
        GridItem(.flexible(), spacing: 0)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20){
                ForEach(pets, id: \.self) { petName in
                    SelectPetView(petName: petName, isSelected: selectedPets.contains(petName))
                        .onTapGesture {
                            if selectedPets.contains(petName) {
                                selectedPets.remove(petName)
                            } else {
                                selectedPets.insert(petName)
                            }
                        }
                        .padding(.horizontal, 4)
                        .background(.gray)
                        .cornerRadius(8)
                }
                AddAnimal(petName: "Add Animal", imageName: "p13")
                    .padding(.horizontal, 4)
                    .background(.gray)
                    .cornerRadius(8)
            }
        }
    }
}


struct SelectPetView: View {
    var petName: String
    var isSelected: Bool
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading,spacing: -30) {
                Image("p6") // Replace with actual image
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
            }
            .frame(width: 130, height: 170)
            .background(Color.clear)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isSelected ? Color.blue : Color.gray, lineWidth: 1)
            )
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
