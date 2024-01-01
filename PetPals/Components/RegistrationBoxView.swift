//
//  RegistrationBoxView.swift
//  PetPals
//
//  Created by user2 on 24/12/23.
//

import SwiftUI

struct RegistrationBoxView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .frame(height: 120)
                .padding(.horizontal)
            VStack{
                HStack{
                    VStack(alignment: .leading ,spacing: 3){
                        Text("Register your service")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                            .font(.title2)
                        Text("Earn extra income and unlock new opportunities by offering your services and love to the pets.")
                            .foregroundStyle(.white)
                            .font(.caption)
                    }
                    
                    
                    Spacer()
                    
                    NavigationLink(destination:JobsServicesView()){
                        Text("Register Now")
                            .foregroundStyle(.white)
                            .frame(width: 110,height: 40)
                            .background(.appYellow)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal,30)
            }
        }
        .shadow(radius: 20)
    }
}

#Preview {
    RegistrationBoxView()
}
