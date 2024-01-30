//
//  becomeASitterBanner.swift
//  PetPals
//
//  Created by Avya Rathod on 28/01/24.
//

import SwiftUI

struct becomeASitterBanner: View {
    var body: some View {
        ZStack {
            Image("p11")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width - 40)
                .frame(height: 250.0)
                .cornerRadius(10)
                .blur(radius: 3)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Become a Sitter")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Earn extra income and unlock new opportunities by sharing your space and love for pets")
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                
                NavigationLink(destination: UserProfileView()) {
                    Text("Learn more")
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.appYellow)
                        .cornerRadius(10)
                }
            }
            .padding()
            .frame(height: 250.0)
            .cornerRadius(10)
            .frame(width: UIScreen.main.bounds.width - 40) // Adjust width to match image width
        }
        .padding()
        .shadow(radius: 5)
    }
}

#Preview {
    becomeASitterBanner()
}
