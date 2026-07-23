//
//  ReceivedMessageBubble.swift
//  VacationChallenge
//
//  Created by Agatha Barbosa Marinho dos Santos on 22/07/26.
//

import SwiftUI

struct ReceivedMessageBubble: View {

    let message: String
    let hour: String

    // conversa em grupo
    let avatarImage: String?
    let senderName: String?
    let senderColor: Color?

    init(
        message: String,
        hour: String,
        avatarImage: String? = nil,
        senderName: String? = nil,
        senderColor: Color? = nil
    ) {
        self.message = message
        self.hour = hour
        self.avatarImage = avatarImage
        self.senderName = senderName
        self.senderColor = senderColor
    }

    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            // topo conversa em grupo
            if let avatarImage,
               let senderName {
              // let senderColor {

                HStack(spacing: 10) {

                    Image(avatarImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 48, height: 48)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(senderColor ?? .blue, lineWidth: 2)
                        }

                    Text(senderName)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(senderColor ?? .blue)

                    Spacer()
                }
            }

            // balao da mensagem
            HStack {

                VStack(alignment: .leading, spacing: 4) {

                    Text(message)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(Color("TextReceiveMessageColor"))
                        .padding(.leading, 10)
                        .padding(.vertical, 6)

                    HStack {

                        Spacer()

                        Text(hour)
                            .font(.system(size: 12, weight: .regular))
                            .foregroundStyle(Color("HourReceiveMessage"))
                    }

                }
                .padding(12)
                .background(Color("ReceiveMessageBallomColor"))
                .clipShape(RoundedRectangle(cornerRadius: 16))

                Spacer(minLength: 60)
            }
        }
    }
}

#Preview {

    VStack(alignment: .leading, spacing: 40) {

        ReceivedMessageBubble(
            message: "Olá! Tudo bem com você?",
            hour: "15:36"
        )

        ReceivedMessageBubble(
            message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            hour: "09:30",
            avatarImage: "Avatar1",
            senderName: "João Pedro",
            senderColor: .blue
        )

    }
    .padding()
    .background(Color("Background"))
}
