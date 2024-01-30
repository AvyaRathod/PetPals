//
//  AboutMeView.swift
//  PetPals
//
//  Created by user2 on 19/12/23.
//

import SwiftUI

struct AboutMeView: View {
    var service: Service
    @State private var Intro = ""
    @State private var Experience = ""
    @State private var Service = ""
    @State private var Skills = ""
    @State private var Qualifications = ""
    
    @EnvironmentObject var serviceProvider: ServiceProvider
    
    var body: some View {
        VStack {
            Form {
                // Introduce yourself
                RoundedSection(header: "Introduce yourself and why you enjoy being with pets ?", text: $Intro)

                // Experience with your pet
                RoundedSection(header: "Tell us about the type of pet you have and your experience with it ?", text: $Experience)

                // Standout service
                RoundedSection(header: "How does your service stand out?", text: $Service)

                // Skills and qualifications
                RoundedSection(header: "Your skills and qualifications?", text: $Skills)

                // Other skills and qualifications
                RoundedSection(header: "Other special skills and qualifications?", text: $Qualifications)
            }
            
            NavigationLink(destination: HomeView()) {
                Button(action: {
                    serviceProvider.isServiceProvider = true
                }, label: {
                    Text("Save")
                        .frame(width: 380, height: 50)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                })
            }
            .padding()
        }
        .navigationTitle("About Me")
    }
}

struct RoundedSection: View {
    var header: String
    @Binding var text: String
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text(header)
                    .font(.headline)
                    .padding(.bottom, 5)
                Spacer()
                Button(action: {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }) {
                    Image(systemName: isExpanded ? "chevron.up.circle" : "questionmark.circle")
                        .foregroundColor(.appBrown)
                }
            }

            if isExpanded {
                TextEditor(text: $text)
                    .frame(height: 80)
                    .padding()
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.appBrown, lineWidth: 1)
                    )
            }
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    AboutMeView(service: Service(img: "pawprint", title: "Pet Boarding", description: "Perfect if the pet needs overnight pet care"))
        .environmentObject(ServiceProvider())
}
