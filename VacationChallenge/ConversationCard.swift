//
//  ConversationCard.swift
//  VacationChallenge
//
//  Created by Agatha Barbosa Marinho dos Santos on 19/07/26.
//

import SwiftUI

struct ConversationCard: View {
    let avatarImage: String
    let userName: String
    let lastMessage: String
    let time: String
    let unreadMessage: Int
    
    var body: some View {
        //card conversa individual
        VStack (spacing: 16) {
            HStack {
                Image(avatarImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                
                VStack (alignment: .leading, spacing: 4) {
                    Text(userName)
                        .font(.system(size: 22, weight: .regular))
                        .foregroundStyle(Color("UserName"))
                    
                    if unreadMessage > 0 {
                        Text(lastMessage)
                            .font(.system(size: 18, weight: .light))
                            .foregroundStyle(Color("UnreadMessageColor"))
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    } else {
                        Text(lastMessage)
                            .font(.system(size: 18, weight: .light))
                            .foregroundStyle(Color("ReadMessageColor"))
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                
                Spacer()
                
                VStack (alignment: .trailing, spacing: 4){
                    Text(time)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(Color("HourConversation"))
                    
                    //Image(systemName: "1.circle.fill")
                      //  .foregroundStyle(Color("PrimaryColor"))
                        //.font(.system(size: 30))
                    
                    if unreadMessage > 0 {
                        Image(systemName: "\(unreadMessage).circle.fill")
                            .foregroundStyle(.white, Color("PrimaryColor"))
                            .font(.system(size: 30))
                    } else {
                        Color.clear.frame(width: 30, height: 30)
                    }
                }
                
                
            }
            .padding(.top, 12)
            //.padding(.horizontal, 16)
            //.padding(.vertical, 12)
            
            Rectangle()
                .fill(Color("DividerColor"))
                .frame(height: 2)
                
                
        }
    }
}

// Preview para ajudar a enxergar o layout no Xcode
#Preview {
    ConversationCard(
        avatarImage: "Avatar1",
        userName: "Agatha Santos",
        lastMessage: "Olá! Bom dia! Tudo bem com você?",
        time: "15:36",
        unreadMessage: 1
    )
    
    
    ConversationCard(
        avatarImage: "Avatar1",
        userName: "Agatha Santos",
        lastMessage: "Olá! Bom dia! Tudo bem com você?",
        time: "15:36",
        unreadMessage: 0
    )
    
}
