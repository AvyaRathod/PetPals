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
            Spacer()
            
            Text("PetPals")
                .font(.largeTitle)
            
            TabView(selection: $currentPage) {
                SplashScreenView(text: "Simply book a pal to look after your pet at your own home",text2: "", imageName: "p14", currentPage: $currentPage)
                    .tag(0)
                SplashScreenView(text: "Seamlessly book our pals to walk your pet",text2: "" , imageName: "p15", currentPage: $currentPage)
                    .tag(1)
                SplashScreenView(text: "Seamlessly book overnight stays for your pet",text2: "", imageName: "p16", currentPage: $currentPage)
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
                    // Skip all pages and move to the home screen
                    isOnboardingCompleted = true
                    UserDefaults.standard.set(true, forKey: "isOnboardingCompleted")
                }) {
                    Text("Skip")
                        .padding()
                        .background(Circle().fill(Color("Cinnamon")))
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
    let text2: String
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
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Text(text2)
                .font(.callout)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
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
