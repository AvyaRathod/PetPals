//
//  ServicePlaccardView.swift
//  PetPals
//
//  Created by Avya Rathod on 20/12/23.
//

import SwiftUI

struct Service: Identifiable {
    let id = UUID()
    let img: String
    let title: String
    let description: String
}

struct ServicePlacardView: View {
    let service: Service

    var body: some View {
        HStack {
            Image(systemName: service.img)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding()

            VStack(alignment: .leading, spacing: 4) {
                Text(service.title)
                    .font(.headline)
                    .foregroundColor(Color.white)
                Text(service.description)
                    .font(.subheadline)
                    .foregroundColor(Color.white)

            }
            .padding(.leading, 4)

            Spacer()

            Image(systemName: "chevron.right") // System icon for the right arrow
                .foregroundColor(.white)
                .padding()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.appYellow))
        .cornerRadius(10)
        .shadow(radius: 2)
        .padding(.horizontal)
    }
}

struct ServicePlacardView_Previews: PreviewProvider {
    static var previews: some View {
        ServicePlacardView(service: Service(img: "pawprint", title: "Pet Boarding", description: "Perfect if the pet needs overnight pet care"))
            .previewLayout(.sizeThatFits)
    }
}
