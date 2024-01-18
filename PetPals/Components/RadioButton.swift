//
//  RadioButton.swift
//  PetPals
//
//  Created by Avya Rathod on 18/01/24.
//

import SwiftUI

struct RadioButton: View {
    let id: String
    let label: String
    @Binding var selectedId: String

    var body: some View {
        HStack {
            
            Text(label)
                .onTapGesture {
                    self.selectedId = self.id
                }
            
            Spacer()
            
            Image(systemName: selectedId == id ? "largecircle.fill.circle" : "circle")
                .onTapGesture {
                    self.selectedId = self.id
                }
        }
        .foregroundColor(selectedId == id ? .blue : .gray)
        
    }
}

struct RadioButtonGroup: View {
    let items: [String]
    @Binding var selectedId: String

    var body: some View {
        ForEach(items, id: \.self) { item in
            RadioButton(id: item, label: item.capitalized, selectedId: $selectedId)
        }
    }
}

struct ServicesListView: View {
    let services = ["daycare", "dayboarding", "sitting", "walking"]
    @State private var selectedService = ""

    var body: some View {
        VStack {
            RadioButtonGroup(items: services, selectedId: $selectedService)
        }
    }
}

struct ServicesListView_Previews: PreviewProvider {
    static var previews: some View {
        ServicesListView()
    }
}
