//
//  OnboardingView.swift
//  PetPals
//
//  Created by Avya Rathod on 16/12/23.
//

import SwiftUI

struct PalsNearbyView: View {
    
    let pals: [Pal] = [
        Pal(name: "Jack Bird", pets: "Dogs, Cats"),
        Pal(name: "Rimi Lan", pets: "Dogs, Cats"),
        Pal(name: "iock Bird", pets: "Dogs, Cats"),
        Pal(name: "Rdemi Lan", pets: "Dogs, Cats"),
        Pal(name: "Jacrk Bird", pets: "Dogs, Cats"),
        Pal(name: "Rimie Lan", pets: "Dogs, Cats"),
        Pal(name: "Jack wBird", pets: "Dogs, Cats"),
        // ... more pals
    ]
    
    // Define the grid layout
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: -20),
        GridItem(.flexible(), spacing: 0)
    ]
    
    let gradient = LinearGradient(
        gradient: Gradient(colors: [Color("app_brown"), Color.white]),
        startPoint: .top,
        endPoint: UnitPoint(x: 0.5, y: 2)
    )
    
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
                            .background(Color("app_yellow"))
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                    .padding(.leading)
                    
                    Spacer()
                }
                .padding([.top, .trailing])
                
                
                // List of Pals
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 0) { // Reduced spacing
                        ForEach(pals, id: \.name) { pal in
                            PalView(palName: pal.name, palPets: pal.pets, imageName: "userimage")
                                .padding(8)
                        }
                    }
                }
            }
            .navigationTitle("Pals Nearby")
            .background(gradient)
        }
    }
}

struct Pal: Identifiable {
    let id = UUID()
    let name: String
    let pets: String
}


#if DEBUG
struct PalsNearbyView_Previews: PreviewProvider {
    static var previews: some View {
        PalsNearbyView()
    }
}
#endif
