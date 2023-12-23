//
//  ImageCarouselView.swift
//  PetPals
//
//  Created by user2 on 23/12/23.
//

import SwiftUI

struct ImageCarouselView: View {
    var images = [
        "petimage-1",
        "petimage-2",
        "petimage-3",
        "petimage-4",
    ]
    
    var body: some View {
        TabView{
            ForEach(images, id: \.self){
                image in Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .frame(height: 320)
        .tabViewStyle(.page)
    }
}

#Preview {
    ImageCarouselView()
}
