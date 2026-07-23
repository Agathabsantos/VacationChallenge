//
//  ConversationsView.swift
//  VacationChallenge
//
//  Created by Agatha Barbosa Marinho dos Santos on 19/07/26.
//

import SwiftUI

struct ConversationsView: View {
    
    @State private var searchText = ""
    
    private let conversations = [
        (
            avatarImage: "Avatar1",
            userName: "Agatha Santos",
            lastMessage: "Olá! Bom dia! Tudo bem com você?",
            time: "15:36",
            unreadMessage: 1
        ),
        (
            avatarImage: "Avatar2",
            userName: "Guilherme Sales",
            lastMessage: "Podemos fazer o prot...",
            time: "10:50",
            unreadMessage: 0
        ),
        (
            avatarImage: "Avatar3",
            userName: "Tim Cook",
            lastMessage: "Receita de bolo formig...",
            time: "9:41",
            unreadMessage: 1
        ),
        (
            avatarImage: "Avatar4",
            userName: "Cris Ikenaga",
            lastMessage: "Feliz aniversário, Cris!...",
            time: "8:30",
            unreadMessage: 0
        ),
        (
            avatarImage: "GroupAvatar",
            userName: "Grupo de estudos",
            lastMessage: "João Pedro: Olá Gus...",
            time: "9:30",
            unreadMessage: 1
        ),
    ]
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            //Título da tela e ícone plus
            VStack (alignment: .leading) {
                HStack {
                    Text("Conversas")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundStyle(Color("TitleColor"))
                    
                    Spacer()
                    
                    Button {
                        //ContactsView()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 42))
                            .foregroundStyle(.white, Color("PrimaryColor"))
                            .frame(width: 44, height: 44)
                    }
                }
                 
                
                //Barra de pesquisa
                SearchBar (
                    placeholder: "Buscar conversas",
                    searchText: $searchText
                )
                
                
                //lista de conversas
                ScrollView {
                    VStack {
                        /*
                        ForEach(conversations.indices, id: \.self) { index in
                            
                            let conversation = conversations[index]
                            
                            NavigationLink {
                                //ChatView(
                                  //  userName: conversation.userName,
                                //    avatarImage: conversation.avatarImage
                                //)
                                Text("Funcionou!")
                            } label: {
                                
                                ConversationCard(
                                    avatarImage: conversation.avatarImage,
                                    userName: conversation.userName,
                                    lastMessage: conversation.lastMessage,
                                    time: conversation.time,
                                    unreadMessage: conversation.unreadMessage
                                )
                            }
                        }*/
                        
                        ForEach(conversations.indices, id: \.self) { index in
                            
                            let conversation = conversations[index]
                                
                                ConversationCard(
                                    avatarImage: conversation.avatarImage,
                                    userName: conversation.userName,
                                    lastMessage: conversation.lastMessage,
                                    time: conversation.time,
                                    unreadMessage: conversation.unreadMessage
                                )
                            
                        }
                    }
                }
                
                
                Spacer()
                
                
            }
            .padding(.horizontal, 24)
            .padding(.top, 20)
            
        
        }
    }
}

#Preview {
    ConversationsView()
}
