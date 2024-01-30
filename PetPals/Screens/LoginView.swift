//
//  LoginView.swift
//  PetPals
//
//  Created by Avya Rathod on 19/12/23.
//

import SwiftUI
import MapKit

struct LoginView: View {
    @EnvironmentObject var userAuth: UserAuth
    
    @State private var shouldNavigate = false
    @State private var email = ""
    @State private var password = ""
    
    let results: Pal
    
    @Binding var startDate: Date
    @Binding var endDate: Date
    @Binding var startTime: Date
    @Binding var endTime: Date
    @Binding var selectedPets: Set<String>
    @Binding var selectedService: String
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                // logo image
                Image ("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                
                Text("Login to create a booking")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                Spacer()
                
                // text fields
                VStack {
                    TextField("Enter your email", text: $email)
                        .autocapitalization(.none)
                        .font (.subheadline)
                        .padding (12)
                        .background (Color(.systemGray6))
                        .cornerRadius (10)
                        .padding (.horizontal, 24)
                    SecureField("Enter your password", text: $password)
                        .font (.subheadline)
                        .padding (12)
                        .background(Color(.systemGray6))
                        .cornerRadius (10)
                        .padding (.horizontal, 24)
                }
                Button {
                    print ("Show forgot password")
                }label: {
                    Text ("Forgot Password?")
                        .font (.footnote)
                        .fontWeight(.semibold)
                        .padding(. top)
                        .padding()
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .trailing)
                
                Button(action: {
                    // Perform login actions here
                    userAuth.isLoggedIn = true
                    shouldNavigate = true
                }) {
                    
                    Text ("Login" )
                        . font (.subheadline)
                        . fontWeight(.semibold)
                        . foregroundColor(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius (8)
                }
                . padding (.vertical)
                
                HStack {
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    Text ("OR")
                        . font (.footnote)
                        . fontWeight(.semibold)
                    Rectangle ()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                }
                .foregroundColor(.gray)
                
                //sign in with apple
                HStack {
                    Image (systemName: "applelogo")
                        .resizable ()
                        .frame(width: 20, height: 25)
                    Text ("Continue with Apple")
                        .font (.footnote)
                        . fontWeight(.semibold)
                        .foregroundColor (Color (.systemBlue))
                }
                .padding(. top, 8)
                Spacer()
                
            }
            .navigationDestination(for: Bool.self) { isLoggedIn in
                if isLoggedIn {
                    CheckoutView(results: results,
                                 startDate: $startDate,
                                 endDate: $endDate,
                                 startTime: $startTime,
                                 endTime: $endTime,
                                 selectedPets:$selectedPets,
                                 selectedService:$selectedService)
                }
            }
        }
        .onChange(of: userAuth.isLoggedIn) {
                    shouldNavigate = userAuth.isLoggedIn
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    @State static var mockDestination: String = "Guduvancheri, India"
    @State static var mockStartDate: Date = Date()
    @State static var mockEndDate: Date = Date()
    @State static var selectedService = "walking"
    @State static var selectedPets:Set<String> = ["Tuffy", "Jerry", "Max", "Buddy"]
    
    static var previews: some View {
        LoginView(results: Pal(
            name: "Alice Johnson",
            profileImage: "petimage-1",
            rating: 4,
            address: "123 anywhere st. any city state country 123",
            summary: "I love spending time with furry friends and have a spacious backyard for them to play.",
            servicesOffered: [
                ServicesOffered(name: .dayboarding, description: "Overnight care for your pet", price: "INR 150/Night"),
                ServicesOffered(name: .daycare, description: "Daytime care", price: "INR 100/Day")
            ],
            acceptedPets: ["Cats", "Dogs"],
            neighborhoodLocation: CLLocationCoordinate2D(latitude: 12.9716, longitude: 77.5946),
            reviews: [
                Review(review: "Alice was wonderful with my Max!", rating: 5, username: "John Doe", profileImage: "profilepic-1"),
                Review(review: "Very caring and attentive.", rating: 4, username: "Emma Stone", profileImage: "profilepic-2"),
                Review(review: "Best pet sitter in town!", rating: 5, username: "Mike Ross", profileImage: "profilepic-3"),
                Review(review: "Highly recommend Alice for pet sitting.", rating: 4, username: "Sarah Connor", profileImage: "profilepic-4")
            ],
            contactInfo: ContactInformation(
                phoneNumber: "1234567890",
                instagramHandle: "@alicepets",
                whatsappNumber: "9876543210"
            )
        ),
                  startDate: $mockStartDate, endDate: $mockEndDate, startTime: $mockStartDate, endTime: $mockEndDate,
        selectedPets: $selectedPets,
        selectedService: $selectedService)
        .environmentObject(UserAuth())
        
    }
}
