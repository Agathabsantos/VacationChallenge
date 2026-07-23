//
//  SentMessageBubble.swift
//  VacationChallenge
//
//  Created by Agatha Barbosa Marinho dos Santos on 22/07/26.
//

import SwiftUI

struct SentMessageBubble: View {
    
    let message: String
    let hour: String
    let isRead: Bool
    
    var body: some View {
        //mensagem enviada
        HStack {
            Spacer(minLength: 60)
            
            VStack (alignment: .trailing, spacing: 4) {
                Text(message)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(Color("TextSendMessageColor"))
                    .padding(.leading, 10)
                    .padding(.vertical, 6)
                
                HStack (spacing: 2) {
                    Text(hour)
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(Color("HourSentMessage"))
                    
                    HStack (spacing: -6) {
                        Image(systemName: "checkmark")
                        Image(systemName: "checkmark")
                    }
                    .font(.system(size: 9
                                  , weight: .regular))
                    .foregroundStyle(Color(isRead ? "ReceivedMessageCheck" : "SentMessageCheck"))
                    
                }
                
            }
            .padding(12)
            .background(Color("SentMessageBallomColor"))
            .clipShape(RoundedRectangle(cornerRadius: 16))

        }
    }
}

#Preview {
    VStack {
        SentMessageBubble(
            message: "Mensagem enviada.",
            hour: "15:45",
            isRead: false
        )

        SentMessageBubble(
            message: "Mensagem lida.",
            hour: "15:46",
            isRead: true
        )

    }
}
