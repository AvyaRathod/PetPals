//
//  ImageCarouselView.swift
//  PetPals
//
//  Created by Avya Rathod on 26/1/24.
//

import SwiftUI

struct ImageCarouselView: View {
    var images = [
        "petimage-1",
        "petimage-2",
        "petimage-3",
        "petimage-4",
    ]

    @State private var currentImageIndex = 0
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var body: some View {
        TabView(selection: $currentImageIndex) {
            ForEach(images.indices, id: \.self) { index in
                Image(images[index])
                    .resizable()
                    .scaledToFill()
                    .tag(index)
            }
        }
        .frame(height: 320)
        .tabViewStyle(.page)
        .onReceive(timer, perform: { _ in
            withAnimation {
                currentImageIndex = (currentImageIndex + 1) % images.count
            }
        })
    }
}

// Preview
struct ImageCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCarouselView()
    }
}

