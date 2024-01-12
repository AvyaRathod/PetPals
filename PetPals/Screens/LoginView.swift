//
//  LoginView.swift
//  PetPals
//
//  Created by Avya Rathod on 19/12/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var userAuth: UserAuth
    
    @State private var shouldNavigate = false
    @State private var email = ""
    @State private var password = ""
    
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
                    CheckoutView()
                }
            }
        }
        .onChange(of: userAuth.isLoggedIn) {
                    shouldNavigate = userAuth.isLoggedIn
        }
    }
}

#Preview {
    LoginView()            
        .environmentObject(UserAuth())

}
