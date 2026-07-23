//
//  ChatHeader.swift
//  VacationChallenge
//
//  Created by Agatha Barbosa Marinho dos Santos on 22/07/26.
//

import SwiftUI

struct ChatHeader: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) private var colorScheme
    let userName: String
    let avatarImage: String
    let status: String
    
    var body: some View {
        
        //topo da tela
        HStack{
            //botao pra voltar
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
            
            
            Image(avatarImage)
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            VStack (alignment: .leading, spacing: 3) {
                Text(userName)
                    .font(.system(size: 20, weight: .regular))
                    .foregroundStyle(Color("UserName"))
                
                HStack (spacing: 4) {
                    Circle()
                        .frame(width: 12, height: 12)
                        .foregroundStyle(Color("CircleStatusColor"))
                    
                    Text(status)
                        .font(.system(size: 12
                                      , weight: .light))
                        .foregroundStyle(Color("TextStatus"))
                }
                
            }
            .padding(.horizontal, 6)
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "phone")
                    .font(.system(size: 28))
                    .foregroundStyle(Color("PhoneColor"))
                    .frame(width: 44, height: 44)
            }
            
                
        }
        .padding(.bottom, 16)
        .padding(.horizontal, 24)
        .background(Color("HeaderConversationColor"))
        
    }
}


#Preview {
    ChatHeader(
        userName: "Agatha Santos",
        avatarImage: "Avatar1",
        status: "online"
    )
}
