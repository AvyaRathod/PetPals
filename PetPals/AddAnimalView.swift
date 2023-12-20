//
//  AddAnimalView.swift
//  PetPals
//
//  Created by user2 on 18/12/23.
//

import SwiftUI

struct AddAnimalView: View {
    @State private var searchText = ""
    let allAnimals = ["Cat","Dog","Parrot","Mouse"]
    
    var body: some View {
        NavigationView {
            List(filteredNames, id: \.self) { name in Text(name)}
                .searchable(text: $searchText, prompt: "Search Animal")
                .navigationTitle("What type of pet is it?")
        }
    }
    var filteredNames: [String] {
        if searchText.isEmpty{
            return allAnimals
        } else {
            return allAnimals.filter { $0.localizedCaseInsensitiveContains(searchText)}
        }
    }
}

#Preview {
    AddAnimalView()
}
