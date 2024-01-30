//
//  ReviewView.swift
//  PetPals
//
//  Created by Avya Rathod on 26/01/24.
//

import SwiftUI



struct ReviewCard: View {
    let review: String
    let rating: Int
    let username: String
    let profileImage: String

    var body: some View {
        HStack(alignment: .top) {
            Image(profileImage)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .shadow(radius: 5)
                .padding(.trailing, 15)

            VStack(alignment: .leading) {
                Text(username)
                    .fontWeight(.bold)
                    .font(.headline)
                StarRatingView(rating: rating)
                    .padding(.vertical, 2)
                Text(review)
                    .italic()
                    .font(.body)
            }
        }
        .frame(height: 100)
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 5)
    }
}

struct ReviewsView: View {
    @State private var currentPage = 0
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    let reviews: [Review] = [
            Review(review: "Great experience!", rating: 5, username: "User1", profileImage: "profilepic-1"),
            Review(review: "Loved the care provided.", rating: 4, username: "User2", profileImage: "profilepic-1"),
            Review(review: "Very friendly and professional.", rating: 5, username: "User3", profileImage: "profilepic-1"),
            Review(review: "My pet had a fantastic time!", rating: 4, username: "User4", profileImage: "profilepic-1"),
            // Add more reviews as needed
        ]

    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<reviews.count, id: \.self) { index in
                    ReviewCard(review: reviews[index].review,
                               rating: reviews[index].rating,
                               username: reviews[index].username,
                               profileImage: reviews[index].profileImage)
                }
            }
            .tabViewStyle(.page)
            .frame(height: 200)
            .onReceive(timer) { _ in
                withAnimation {
                    currentPage = (currentPage + 1) % reviews.count
                }
            }
        }
        .background(Color.primary.colorInvert().opacity(0.05))
        .cornerRadius(20)
    }
}

#Preview {
    ReviewsView().background(Color.utilGrey)
}
