//
//  MyFavTabView.swift
//  PetPals
//
//  Created by user2 on 01/01/24.
//

import SwiftUI

struct MyFavTabView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .frame(height: 120)
                .padding(.horizontal)
            VStack{
                HStack{
                    Button(action: {}, label: {
                        VStack {
                            Text("❤️")
                                .font(.custom("", size: 40))
                            Text("Favourites")
                                .padding(.horizontal,0.5)
                        }
                        .foregroundStyle(.white)
                        .frame(width: 100,height: 80)
                        .background(.appYellow)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                    Button(action: {}, label: {
                        VStack {
                            Text("👩‍💻")
                                .font(.custom("", size: 40))
                            Text("Help Center")
                        }
                        .foregroundStyle(.white)
                        .frame(width: 100,height: 80)
                        .background(.appYellow)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                    Button(action: {}, label: {
                        VStack {
                            Text("📝")
                                .font(.custom("", size: 40))
                            Text("My Listings")
                        }
                        .foregroundStyle(.white)
                        .frame(width: 100,height: 80)
                        .background(.appYellow)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                }
                .padding(.horizontal,30)
            }
        }
        .shadow(radius: 20)
    }
}

#Preview {
    MyFavTabView()
}
