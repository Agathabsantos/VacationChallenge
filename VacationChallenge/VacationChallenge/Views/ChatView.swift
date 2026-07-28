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
    @State private var messageText = "" // estado da barra de digitação
    @State private var keyboardVisible = false // estado do teclado

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
        //.background(Color("BackgroundConversationScreen").ignoresSafeArea())
        .background(Color("BackgroundConversationScreen").ignoresSafeArea(.container))
        
        // cabeçalho fixo com efeito de translucidez
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
        ChatView(userName: "Agatha Santos", avatarImage: "Avatar1")
    }
}
