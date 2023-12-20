//
//  ChatView.swift
//  PetPals
//
//  Created by Avya Rathod on 19/12/23.
//

import SwiftUI

struct ChatView: View {
    var senderName: String
    @State private var messageText: String = ""
    @State private var messages: [ChatMessage] // Holds all chat messages
    
    init(senderName: String) {
        self.senderName = senderName
        // Initialize with some mock messages for demonstration purposes
        _messages = State(initialValue: [
            ChatMessage(text: "Hey, how's it going?", isFromCurrentUser: false),
            ChatMessage(text: "Not bad, thanks for asking!", isFromCurrentUser: true),
            ChatMessage(text: "Do you have any plans for the weekend?", isFromCurrentUser: false),
            ChatMessage(text: "I'm planning to go hiking. Want to join?", isFromCurrentUser: true)
        ])
    }

    var body: some View {
        VStack {
            Divider()
                .padding(.vertical)

            // Chat messages
            ScrollView {
                ScrollViewReader { scrollViewProxy in
                    LazyVStack(spacing: 8) {
                        ForEach(messages) { message in
                            ChatBubble(isFromCurrentUser: message.isFromCurrentUser, messageText: message.text)
                        }
                    }
                    .padding()
                }
            }
            .background(Color.white) // Set the background color of the chat area if necessary
            
            // Message input field
            HStack {
                TextField("Type a message...", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading)

                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                }
                .padding()
            }
            .background(Color.primary.colorInvert()) // Inverted color for the input area
        }
        .navigationBarTitle(Text(senderName), displayMode: .inline)
    }
    // Send message action
    private func sendMessage() {
        guard !messageText.isEmpty else { return }
        let newMessage = ChatMessage(text: messageText, isFromCurrentUser: true)
        messages.append(newMessage)
        messageText = "" // Clear input field
    }
}

struct ChatBubble: View {
    var isFromCurrentUser: Bool
    var messageText: String

    var body: some View {
        HStack {
            if isFromCurrentUser { Spacer() }

            Text(messageText)
                .padding()
                .foregroundColor(isFromCurrentUser ? .white : .black)
                .background(isFromCurrentUser ? Color.blue : Color(white: 0.9))
                .cornerRadius(15)
                .frame(maxWidth: 300, alignment: isFromCurrentUser ? .trailing : .leading)

            if !isFromCurrentUser { Spacer() }
        }
        .transition(.slide) // Add a transition effect for new messages
    }
}


struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isFromCurrentUser: Bool
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatView(senderName: "Jane Doe")
        }
    }
}
