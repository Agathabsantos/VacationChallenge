//
//  ConversationsView.swift
//  VacationChallenge
//
//  Created by Agatha Barbosa Marinho dos Santos on 19/07/26.
//

import SwiftUI

struct ConversationsView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            VStack (alignment: .leading) {
                HStack {
                    Text("Conversas")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundStyle(Color("TitleColor"))
                    
                    Spacer()
                    
                    Button {
                        //TODO: Navegar para a tela de contatos
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 42))
                            .foregroundStyle(.white, Color("PrimaryColor"))
                            .frame(width: 44, height: 44)
                    }
                }
                 
                //Spacer()
                
                //Barra de pesquisa
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(Color("SearchBarText"))
                        .font(.system(size: 17))
                        
                    TextField(
                        text: $searchText,
                        prompt: Text("Buscar conversas")
                            .foregroundColor(Color("SearchBarText"))
                            .font(.system(size: 17))
                    ){
                    }
                    .foregroundStyle(Color("SearchBarText"))
                        
                    
                    Image(systemName: "microphone.fill")
                        .foregroundStyle(Color("SearchBarText"))
                        .font(.system(size: 17))
                }
                .padding(.horizontal, 12)
                .frame(height: 44)
                .background(Color("SearchBarBackground"))
                .cornerRadius(30)
                
                ConversationCard(
                    avatarImage: "Avatar1",
                    userName: "Agatha Santos",
                    lastMessage: "Olá! Bom dia! Tudo bem com você?",
                    time: "15:36",
                    unreadMessage: 1
                )
            
                ConversationCard(
                    avatarImage: "Avatar2",
                    userName: "Guilherme Sales",
                    lastMessage: "Podemos fazer o prot...",
                    time: "10:50",
                    unreadMessage: 0
                )
                
                ConversationCard(
                    avatarImage: "Avatar3",
                    userName: "Tim Cook",
                    lastMessage: "Receita de bolo formig...",
                    time: "10:50",
                    unreadMessage: 1
                )
                
                ConversationCard(
                    avatarImage: "Avatar4",
                    userName: "Cris Ikenaga",
                    lastMessage: "Feliz aniversário, Cris!...",
                    time: "10:50",
                    unreadMessage: 0
                )
                
                ConversationCard(
                    avatarImage: "GroupAvatar",
                    userName: "Grupo de estudos",
                    lastMessage: "João Pedro: Olá Gus...",
                    time: "10:50",
                    unreadMessage: 1
                )
                
                
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

