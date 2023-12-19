//
//  SelectYourPetsView.swift
//  PetPals
//
//  Created by user2 on 19/12/23.
//

import SwiftUI

struct SelectYourPetsView: View {
    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false) {
                HStack {
                    PetView(petName: "Tuffy", imageName: "Dogs")
                        .padding(.horizontal, 4)
                        .background(.gray)
                        .cornerRadius(8)
                    PetView(petName: "Jerry", imageName: "Dogs")
                        .padding(.horizontal, 4)
                        .background(.gray)
                        .cornerRadius(8)
                }
                .padding(.vertical,4)
                HStack {
                    PetView(petName: "Tuffy", imageName: "Dogs")
                        .padding(.horizontal, 4)
                        .background(.gray)
                        .cornerRadius(8)
                    PetView(petName: "Jerry", imageName: "Dogs")
                        .padding(.horizontal, 4)
                        .background(.gray)
                        .cornerRadius(8)
                }
                .padding(.vertical,4)
                HStack {
                    PetView(petName: "Tuffy", imageName: "Dogs")
                        .padding(.horizontal, 4)
                        .background(.gray)
                        .cornerRadius(8)
                    PetView(petName: "Add Animal", imageName: "Dogs")
                        .padding(.horizontal, 4)
                        .background(.gray)
                        .cornerRadius(8)
                }
                .padding(.vertical,4)
            }
            .padding(.vertical)
            .navigationTitle("Select your pets")
        }
    }
}

#Preview {
    SelectYourPetsView()
}
