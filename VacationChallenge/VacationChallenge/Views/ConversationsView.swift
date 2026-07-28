//
//  ConversationsView.swift
//  VacationChallenge
//
//  Created by Agatha Barbosa Marinho dos Santos on 19/07/26.
//

import SwiftUI

struct ConversationsView: View {
    
    @State private var searchText = "" // estado da barra de pesquisa
    @State private var scrollOffset: CGFloat = 0 // armazena a posição atual do ScrollView para detectar quando houve rolagem
    
    // ajustes do cabeçalho fixo
    private let headerOverlap: CGFloat = -60
    private let topPadding: CGFloat = 80
    
    private var isScrolled: Bool { // verifica quando a lista já foi rolada
        scrollOffset < 0
    }
    
    private let conversations = [
        (
            avatarImage: "Avatar1",
            userName: "Agatha Santos",
            lastMessage: "Olá! Bom dia! Tudo bem com você?",
            time: "15:36",
            unreadMessage: 1,
            isGroup: false
        ),
        (
            avatarImage: "Avatar2",
            userName: "Guilherme Sales",
            lastMessage: "Podemos fazer o prot...",
            time: "10:50",
            unreadMessage: 0,
            isGroup: false
        ),
        (
            avatarImage: "Avatar3",
            userName: "Tim Cook",
            lastMessage: "Receita de bolo formig...",
            time: "9:41",
            unreadMessage: 1,
            isGroup: false
        ),
        (
            avatarImage: "Avatar4",
            userName: "Cris Ikenaga",
            lastMessage: "Feliz aniversário, Cris!...",
            time: "8:30",
            unreadMessage: 0,
            isGroup: false
        ),
        (
            avatarImage: "GroupAvatar",
            userName: "Grupo de estudos",
            lastMessage: "João Pedro: Olá Gus...",
            time: "9:30",
            unreadMessage: 1,
            isGroup: true
        ),
    ]
    
    var body: some View {
        ScrollView {
            
            // captura a posição do ScrollView pra aplicar o efeito de ultraThinMaterial no cabeçalho
            ScrollOffsetReader { offset in
                scrollOffset = offset
            }
            .frame(height: 0)
            
            //lista de conversas
            VStack {
                ForEach(conversations.indices, id: \.self) { index in
                    
                    let conversation = conversations[index]
                    
                    NavigationLink {
                        if conversation.isGroup {
                            GroupChatView(
                                userName: conversation.userName,
                                avatarImage: conversation.avatarImage
                            )
                        } else {
                            ChatView(
                                userName: conversation.userName,
                                avatarImage: conversation.avatarImage
                            )
                        }
                    } label: {
                        ConversationCard(
                            avatarImage: conversation.avatarImage,
                            userName: conversation.userName,
                            lastMessage: conversation.lastMessage,
                            time: conversation.time,
                            unreadMessage: conversation.unreadMessage
                        )
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, 24)

        }
        .coordinateSpace(name: "SCROLL")
        .background(Color("Background").ignoresSafeArea())
        
        // cabeçalho fixo que recebe efeito de translucidez após o scroll
        .safeAreaInset(edge: .top, spacing: headerOverlap) {
            VStack(alignment: .leading, spacing: 0) {
                //Título da tela e ícone plus
                HStack {
                    Text("Conversas")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundStyle(Color("TitleColor"))
                    
                    Spacer()
                    
                    NavigationLink {
                        ContactsView()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 42))
                            .foregroundStyle(.white, Color("PrimaryColor"))
                            .frame(width: 44, height: 44)
                    }
                    .buttonStyle(.plain)
                }
                
                //Barra de pesquisa
                SearchBar(
                    placeholder: "Buscar conversas",
                    searchText: $searchText,
                    isScrolled: isScrolled
                )
                .padding(.top, 12)
            }
            .padding(.horizontal, 24)
            .padding(.top, topPadding)
            .background {
                if isScrolled {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .overlay(Color("Background").opacity(0.4))
                } else {
                    Color("Background")
                }
            }
            .ignoresSafeArea(edges: .top)
            .animation(.easeInOut(duration: 0.2), value: isScrolled)
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        ConversationsView()
    }
}
