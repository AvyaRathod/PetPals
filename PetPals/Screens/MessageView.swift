//
//  MessageView.swift
//  PetPals
//
//  Created by Avya Rathod on 19/12/23.
//

import SwiftUI

struct MessageView: View {
    @State private var isShowingChatView = false
    @State private var selectedChat: Chat?
    
    @State private var chats: [Chat] = [
        Chat(senderName: "Jane Doe", lastMessagePreview: "Hey, how are you?", lastMessageTime: "3:42 PM", unreadMessagesCount: 2),
        Chat(senderName: "Jane Doe", lastMessagePreview: "Hey, how are you?", lastMessageTime: "3:42 PM", unreadMessagesCount: 2)
        // Add more Chat instances to populate the list
    ] // Holds the list of chats

    var body: some View {
        NavigationView {
            if chats.isEmpty {
                // Message displayed when there are no chats
                VStack {
                    Text("You have no messages")
                        .font(.title)
                        .padding()
                    Text("You can send and receive messages when you have upcoming bookings")
                        .multilineTextAlignment(.center)
                        .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .navigationTitle("Messages")
            } else {
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(chats) { chat in
                            ChatPlacardView(
                                profileImage: Image(systemName: "person.crop.circle.fill"), // Replace with actual image
                                senderName: chat.senderName,
                                lastMessagePreview: chat.lastMessagePreview,
                                lastMessageTime: chat.lastMessageTime,
                                unreadMessagesCount: chat.unreadMessagesCount
                            )
                        }
                    }
                    .padding(.horizontal)
                }
                
            }
        }
        .navigationTitle("Messages")
    }
}

// Mock chat model for demonstration purposes
struct Chat: Identifiable {
    let id = UUID()
    let senderName: String
    let lastMessagePreview: String
    let lastMessageTime: String
    let unreadMessagesCount: Int
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
