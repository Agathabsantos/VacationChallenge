//
//  ChatView.swift
//  VacationChallenge
//
//  Created by Agatha Barbosa Marinho dos Santos on 20/07/26.
//

import SwiftUI

struct ChatView: View {
    
    let userName: String
    let avatarImage: String
    @State private var messageText = ""

    var body: some View {
        ScrollView {
            VStack (spacing: 12) {
                DateTag(text: "hoje")
                
                ReceivedMessageBubble(
                    message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut ",
                    hour: "15:36"
                )
                
                SentMessageBubble(
                    message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut ",
                    hour: "15:45",
                    isRead: true
                )
                
                ReceivedMessageBubble(
                    message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut ",
                    hour: "15:36"
                )
                
                SentMessageBubble(
                    message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut ",
                    hour: "15:45",
                    isRead: false
                )
                
                TypingIndicator()
            }
            .padding(.horizontal, 24)
            .padding(.top, 12)
        }
        .background(Color("BackgroundConversationScreen").ignoresSafeArea())
        .safeAreaInset(edge: .top, spacing: 0) {
            ChatHeader(
                userName: userName,
                avatarImage: avatarImage,
                status: "online"
            )
            .background {
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .overlay(Color("HeaderConversationColor").opacity(0.4))
                    .ignoresSafeArea(edges: .top)
            }
            .overlay(alignment: .bottom) {
                Divider()
            }
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            MessageInputBar(messageText: $messageText)
                .background {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .overlay(Color("HeaderConversationColor").opacity(0.4))
                        .ignoresSafeArea(edges: .bottom)
                }
                .overlay(alignment: .top) {
                    Divider()
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        ChatView(userName: "Agatha Santos", avatarImage: "Avatar1")
    }
}
