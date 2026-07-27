//
//  GroupChatView.swift
//  VacationChallenge
//
//  Created by Agatha Barbosa Marinho dos Santos on 22/07/26.
//

import SwiftUI

struct GroupChatView: View {
    
    let userName: String
    let avatarImage: String
    @State private var messageText = ""
    
    var body: some View {
        ScrollView {
            VStack (spacing: 12) {
                DateTag(text: "09/06/2026")
                
                ReceivedMessageBubble(
                    message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut ",
                    hour: "09:30",
                    avatarImage: "Avatar5",
                    senderName: "João Pedro",
                    senderColor: Color("Avatar5")
                )
                
                SentMessageBubble(
                    message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed  ",
                    hour: "15:45",
                    isRead: true
                )
                
                ReceivedMessageBubble(
                    message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed ",
                    hour: "09:30",
                    avatarImage: "Avatar6",
                    senderName: "Luiza Henrique",
                    senderColor: Color("Avatar6")
                )
                
                SentMessageBubble(
                    message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed  ",
                    hour: "15:45",
                    isRead: false
                )
                
                TypingIndicator(text: "João está digitando... ")
            }
            .padding(.horizontal, 24)
            .padding(.top, 12)
        }
        .background(Color("BackgroundConversationScreen").ignoresSafeArea())
        .safeAreaInset(edge: .top, spacing: 0) {
            ChatHeader(
                userName: userName,
                avatarImage: avatarImage,
                status: "2 online"
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
        GroupChatView(userName: "Grupo de estudos", avatarImage: "GroupAvatar")
    }
}
