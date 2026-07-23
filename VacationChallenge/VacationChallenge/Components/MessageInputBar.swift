//
//  MessageInputBar.swift
//  VacationChallenge
//
//  Created by Agatha Barbosa Marinho dos Santos on 22/07/26.
//

import SwiftUI

struct MessageInputBar: View {
    @Binding var messageText: String

    var body: some View {
        //Barra de digitacao
        HStack (alignment: .center, spacing: 0) {
        
            Button {

            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 20, weight: .regular))
                    .foregroundStyle(Color("PlusColor"))
                    .frame(width: 44, height: 44)
                    .padding(.leading, 3)
            }
                
            MessageBar(
                placeholder: "Digite uma mensagem",
                messageText: $messageText
            )
            .padding(.leading, 8)
            .padding(.trailing, 8)
            
            Button {

            } label: {
                Image(systemName: "paperplane.circle.fill")
                    .font(.system(size: 40))
                    .foregroundStyle(.white, Color("PrimaryColor"))
                    .frame(width: 44, height: 44)
            }
        }
         .frame(height: 26)
         .padding(.horizontal, 20)
         .padding(.top, 34)
         .background(Color("HeaderConversationColor"))
    }
}

#Preview {

    @Previewable @State var text = ""

    MessageInputBar(
        messageText: $text
    )
}
