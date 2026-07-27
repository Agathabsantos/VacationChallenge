//
//  ContactsView.swift
//  VacationChallenge
//
//  Created by Agatha Barbosa Marinho dos Santos on 20/07/26.
//

import SwiftUI

struct ContactsView: View {
    
    @State private var searchText = ""
    @State private var scrollOffset: CGFloat = 0
    private let headerOverlap: CGFloat = -60
    private let topPadding: CGFloat = 80
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) private var colorScheme
    
    private var isScrolled: Bool {
        scrollOffset < 0
    }
    
    @State private var selectedContacts: [Bool] = [
        false,
        false,
        true,
        false
    ]
    
    private let contacts = [
        (
            avatarImage: "Avatar1",
            userName: "Agatha Santos",
            status: "online",
            isOnline: true
        ),
        (
            avatarImage: "Avatar2",
            userName: "Guilherme Sales",
            status: "offline",
            isOnline: false
        ),
        (
            avatarImage: "Avatar3",
            userName: "Tim Cook",
            status: "online",
            isOnline: true
        ),
        (
            avatarImage: "Avatar4",
            userName: "Cris Ikenaga",
            status: "online",
            isOnline: true
        )
    ]
    
    var body: some View {
        ZStack(alignment: .trailing) {
            ScrollView {
                ScrollOffsetReader { offset in
                    scrollOffset = offset
                }
                .frame(height: 0)
                
                VStack (alignment: .leading) {
                    //botoes +contato e +grupo
                    HStack (spacing: 12) {
                        ContactActionButton(
                            title: "Novo contato",
                            systemImage: "plus",
                            action: {}
                        )
                        
                        ContactActionButton(
                            title: "Novo grupo",
                            systemImage: "person.2",
                            action: {}
                        )
                    }
                    
                    //lista de contatos
                    VStack(spacing: 0) {
                        ForEach(contacts.indices, id: \.self) { index in
                            let contact = contacts[index]
                            
                            ContactCard(
                                avatarImage: contact.avatarImage,
                                userName: contact.userName,
                                status: contact.status,
                                isOnline: contact.isOnline,
                                isSelected: $selectedContacts[index]
                            )
                        }
                    }
                    .padding(.trailing, 28)
                    
                }
                .padding(.horizontal, 24)
                .padding(.top, 12)
                
                
            }
            .coordinateSpace(name: "SCROLL")
            
            AlphabetIndex()
                .padding(.trailing, 10)
                .padding(.top, 60)
            
        }
        .background(Color("Background").ignoresSafeArea())
        .safeAreaInset(edge: .top, spacing: headerOverlap) {
            VStack(alignment: .leading, spacing: 0) {

                HStack {

                    Button {
                        dismiss()
                    } label: {
                        ZStack {
                            Circle()
                                .fill(.ultraThinMaterial)
                                .overlay(
                                    Circle()
                                        .stroke(
                                            LinearGradient(
                                                colors: [
                                                    .white.opacity(colorScheme == .dark ? 0.35 : 0.8),
                                                    .white.opacity(colorScheme == .dark ? 0.05 : 0.15)
                                                ],
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            ),
                                            lineWidth: colorScheme == .dark ? 0.75 : 1.5
                                        )
                                )
                                .shadow(
                                    color: .black.opacity(colorScheme == .dark ? 0.3 : 0.12),
                                    radius: 5,
                                    x: 0,
                                    y: 2
                                )

                            Image(systemName: "chevron.left")
                                .font(.system(size: 24, weight: .regular))
                                .foregroundStyle(colorScheme == .dark ? .gray : .black)
                        }
                        .frame(width: 48, height: 48)
                    }
                    .padding(.trailing, 10)

                    Text("Contatos")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundStyle(Color("TitleColor"))

                    Spacer()
                }

                SearchBar(
                    placeholder: "Buscar por contato",
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
        
        
        //footer
        .safeAreaInset(edge: .bottom, spacing: 0) {
            VStack(spacing: 10) {
                //aviso
                WarningCard()
                
                //botao iniciar o contato
                ContactActionButton(
                    title: "Iniciar conversa",
                    action: {}
                )
            }
            .padding(.horizontal, 24)
            .padding(.top, 26)
            .background {
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .overlay(Color("Background").opacity(0.4))
                    .ignoresSafeArea(edges: .bottom)
            }
            .ignoresSafeArea(edges: .bottom)
            .overlay(alignment: .bottom) {
                if isScrolled {
                    Divider()
                        .offset(y: -62)
                }
            }
        
        }
        .toolbar(.hidden, for: .navigationBar)
        
    }
}

#Preview {
    NavigationStack {
        ContactsView()
    }
}
