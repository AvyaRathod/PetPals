//
//  OnboardingView.swift
//  PetPals
//
//  Created by Avya Rathod on 09/12/23.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var isOnboardingCompleted: Bool
    @State private var currentPage = 0
    
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Skip") {
                    isOnboardingCompleted = true
                }
                .padding()
            }
            
            Spacer()
            
            TabView(selection: $currentPage) {
                SplashScreenView(text: "Welcome to PetPals!", imageName: "petimage-1", currentPage: $currentPage)
                    .tag(0)
                SplashScreenView(text: "Connect with pet lovers!", imageName: "petimage-2", currentPage: $currentPage)
                    .tag(1)
                SplashScreenView(text: "Find the perfect sitter!", imageName: "petimage-3", currentPage: $currentPage)
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 500)
            
            Spacer()
            
            HStack {
                HStack(spacing: 8) {
                    ForEach(0..<3, id: \.self) { index in
                        Circle()
                            .fill(currentPage == index ? Color.blue : Color.gray)
                            .frame(width: 8, height: 8)
                    }
                }
                .padding(.leading)
                
                Spacer()
                
                Button(action: {
                    if currentPage < 2 {
                        withAnimation {
                            currentPage += 1
                        }
                    } else {
                        isOnboardingCompleted = true
                    }
                }) {
                    Image(systemName: currentPage < 2 ? "arrow.right" : "checkmark")
                        .padding()
                        .background(Circle().fill(Color.blue))
                        .foregroundColor(.white)
                }
                .padding(.trailing)
            }
        }
        .transition(.slide)
    }
}

struct SplashScreenView: View {
    let text: String
    let imageName: String
    @Binding var currentPage: Int
    var body: some View {
        VStack {
            // Placeholder for image
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 300)
            
            // Text content of the splash screen
            Text(text)
                .font(.title)
                .padding()
        }
    }
}

#if DEBUG
struct OnboardingView_Previews: PreviewProvider {
    @State static var isOnboardingCompleted = false

    static var previews: some View {
        OnboardingView(isOnboardingCompleted: $isOnboardingCompleted)
    }
}
#endif
