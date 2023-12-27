//
//  ChatPlacardView.swift
//  PetPals
//
//  Created by Avya Rathod on 19/12/23.
//

import SwiftUI

struct ChatPlacardView: View {
    var profileImage: Image
    var senderName: String
    var lastMessagePreview: String
    var lastMessageTime: String
    var unreadMessagesCount: Int

    var body: some View {
        NavigationLink(destination: ChatView(senderName: senderName)) {
            HStack(spacing: 12) {
                profileImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(senderName)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(lastMessagePreview)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text(lastMessageTime)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    if unreadMessagesCount > 0 {
                        Text("\(unreadMessagesCount)")
                            .font(.caption2)
                            .foregroundColor(.white)
                            .padding(5)
                            .background(Color.red)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    }
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 2)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct ChatPlacardView_Previews: PreviewProvider {
    static var previews: some View {
        ChatPlacardView(
            profileImage: Image(systemName: "person.crop.circle.fill"),
            senderName: "Jane Doe",
            lastMessagePreview: "Hey, how are you?",
            lastMessageTime: "3:42 PM",
            unreadMessagesCount: 2
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
