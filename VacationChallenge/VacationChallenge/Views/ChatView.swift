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
        ZStack {
            Color("BackgroundConversationScreen")
                .ignoresSafeArea()
            
            VStack {
                
                //topo da tela
                ChatHeader(
                    userName: userName,
                    avatarImage: avatarImage,
                    status: "online"
                )
                                
                //Aréas das mensagens
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
                }
            
                Spacer()
                
                //barra de digitacao
                MessageInputBar(
                    messageText: $messageText
                )
              
            }
            
        }
    }
}

#Preview {
    ChatView(userName: "Agatha Santos", avatarImage: "Avatar1")
}

