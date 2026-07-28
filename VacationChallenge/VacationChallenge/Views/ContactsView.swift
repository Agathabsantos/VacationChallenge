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
    @State private var keyboardVisible = false
    @State private var headerHeight: CGFloat = 0
    @State private var footerHeight: CGFloat = 0
    
    private let topPadding: CGFloat = 100
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) private var colorScheme
    
    private var isScrolled: Bool {
        scrollOffset < 0
    }
    
    private var shouldUseMaterial: Bool {
        isScrolled || keyboardVisible
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
        /* utiliza GeometryReader para manter o cabeçalho e o rodapé fixos,
          evita que o teclado reposicione esses elementos */
        GeometryReader { geo in
            ZStack(alignment: .topLeading) {
                Color("Background").ignoresSafeArea()
                
                // conteúdo rolável
                ScrollView {
                    ScrollOffsetReader { offset in
                        scrollOffset = offset
                    }
                    .frame(height: 0)
                    
                    VStack(alignment: .leading) {
                        HStack(spacing: 12) {
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
                    .padding(.top, 140)
                }
                .coordinateSpace(name: "SCROLL")
                .padding(.top, headerHeight)
                .padding(.bottom, footerHeight)
                .frame(width: geo.size.width, height: geo.size.height)
                
                // índice alfabético fixo
                AlphabetIndex()
                    .padding(.trailing, 10)
                    .padding(.top, headerHeight + 200)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                // header fixo: posição absoluta, não depende de safeAreaInset
                headerView(safeAreaTop: geo.safeAreaInsets.top)
                    .measureSize { size in
                        headerHeight = size.height
                    }
                    .frame(width: geo.size.width)
                    .position(
                        x: geo.size.width / 2,
                        y: headerHeight / 2
                    )
                
                // footer fixo: posição absoluta, não depende de safeAreaInset
                footerView
                    .measureSize { size in
                        footerHeight = size.height
                    }
                    .frame(width: geo.size.width)
                    .position(
                        x: geo.size.width / 2,
                        y: geo.size.height - geo.safeAreaInsets.bottom - footerHeight / 2
                    )
            }
        }
        .ignoresSafeArea(.keyboard, edges: .all)
        .toolbar(.hidden, for: .navigationBar)
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
    
    // header
    private func headerView(safeAreaTop: CGFloat) -> some View {
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
                                radius: 5, x: 0, y: 2
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
                isScrolled: shouldUseMaterial
            )
            .padding(.top, 12)
        }
        .padding(.horizontal, 24)
        .padding(.top, safeAreaTop + topPadding )
        .padding(.bottom, 12)
        .background {
            if shouldUseMaterial {
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .overlay(Color("Background").opacity(0.4))
            } else {
                Color("Background")
            }
        }
        .animation(.easeInOut(duration: 0.2), value: shouldUseMaterial)
    }
    
    // footer
    private var footerView: some View {
        VStack(spacing: 10) {
            WarningCard()
            
            ContactActionButton(
                title: "Iniciar conversa",
                action: {}
            )
        }
        .padding(.horizontal, 24)
        .padding(.top, 30)
        .padding(.bottom, 70)
        .background {
            Rectangle()
                .fill(.ultraThinMaterial)
                .overlay(Color("Background").opacity(0.4))
        }
    }
}

#Preview {
    NavigationStack {
        ContactsView()
    }
}
