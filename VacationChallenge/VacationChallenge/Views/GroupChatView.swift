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
    @State private var messageText = "" // estado da barra de digitação
    @State private var keyboardVisible = false // estado do teclado
    
    var body: some View {
        ScrollView {
            VStack (spacing: 12) {
                DateTag(text: "09/06/2026")
                
                ReceivedMessageBubble(
                    message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ",
                    hour: "09:30",
                    avatarImage: "Avatar5",
                    senderName: "João Pedro",
                    senderColor: .blue
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
                    senderColor: .pink
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
        //.background(Color("BackgroundConversationScreen").ignoresSafeArea())
        .background(Color("BackgroundConversationScreen").ignoresSafeArea(.container))
        
        // cabeçalho fixo com efeito de translucidez
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
                    .ignoresSafeArea(.container, edges: .top)
            }
            .overlay(alignment: .bottom) {
                Divider()
            }
        }
        
        // rodapé fixo com efeito de translucidez
        .overlay(alignment: .bottom) {
            MessageInputBar(messageText: $messageText)
                .padding(.bottom, keyboardVisible ? 30 : 0)
                .background {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .overlay(Color("HeaderConversationColor").opacity(0.4))
                        .frame(height: keyboardVisible ? 200 : nil)
                        .offset(y: keyboardVisible ? 55 : 0)
                        .ignoresSafeArea(.container, edges: .bottom)
                }
                .overlay(alignment: .top) {
                    Divider()
                }
        }
        .navigationBarBackButtonHidden(true)
        
        .onReceive(
            NotificationCenter.default.publisher(
                for: UIResponder.keyboardWillShowNotification
            )
        ) { _ in
            keyboardVisible = true
        }

        .onReceive(
            NotificationCenter.default.publisher(
                for: UIResponder.keyboardWillHideNotification
            )
        ) { _ in
            keyboardVisible = false
        }
        
        
    }
}

#Preview {
    NavigationStack {
        GroupChatView(userName: "Grupo de estudos", avatarImage: "GroupAvatar")
    }
}
