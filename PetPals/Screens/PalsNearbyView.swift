//
//  OnboardingView.swift
//  PetPals
//
//  Created by Avya Rathod on 16/12/23.
//

import SwiftUI

struct PalsNearbyView: View {
    var serviceName: String
    
    let pals: [Pals] = [
        Pals(name: "Jack Bird", pets: "Dogs, Cats", userimage:  "p1"),
        Pals(name: "Rimi Lan", pets: "Dogs, Cats", userimage:  "p2"),
        Pals(name: "iock Bird", pets: "Dogs, Cats", userimage:  "p3"),
        Pals(name: "Rdemi Lan", pets: "Dogs, Cats", userimage:  "p4"),
        Pals(name: "Jacrk Bird", pets: "Dogs, Cats", userimage:  "p5"),
        Pals(name: "Rimie Lan", pets: "Dogs, Cats", userimage:  "p11"),
        Pals(name: "Jack wBird", pets: "Dogs, Cats", userimage:  "p12"),
        // ... more pals
    ]
    
    // Define the grid layout
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: -20),
        GridItem(.flexible(), spacing: 0)
    ]
    
    // State to show/hide the filter options
    @State private var showFilters = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Menu {
                        Button("Cost", action: { /* Apply cost filter */ })
                        Button("Distance", action: { /* Apply distance filter */ })
                    } label: {
                        Label("Filter", systemImage: "line.horizontal.3.decrease.circle")
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            .background(Color("Cinnamon"))
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                    .padding(.leading)
                    
                    Spacer()
                }
                .padding([.top, .trailing])
                
                
                // List of Pals
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 0) {
                        ForEach(pals, id: \.id) { pal in
                            PalView(palName: pal.name, palPets: pal.pets, imageName: pal.userimage)
                                .padding(8)
                        }
                    }
                }
            }
            .navigationTitle("Pals Nearby")
        }
    }
}

struct Pals: Identifiable {
    let id = UUID()
    let name: String
    let pets: String
    let userimage: String
}


#if DEBUG
struct PalsNearbyView_Previews: PreviewProvider {
    static var previews: some View {
        PalsNearbyView(serviceName: "None")
    }
}
#endif
