//
//  MessageBar.swift
//  VacationChallenge
//
//  Created by Agatha Barbosa Marinho dos Santos on 21/07/26.
//

import SwiftUI

struct MessageBar: View {
    
    let placeholder: String
    
    @Binding var messageText: String
    
    var body : some View {
        HStack {
            TextField(
                text: $messageText,
                prompt: Text(placeholder)
                    .foregroundColor(Color("SearchBarText"))
                    .font(.system(size: 17))
            ){
            }
            .foregroundStyle(Color("SearchBarText"))
            .padding(10)
            
            Image(systemName: "microphone.fill")
                .foregroundStyle(Color("SearchBarText"))
                .font(.system(size: 17))
        }
        .padding(.horizontal, 12)
        .frame(height: 44)
        .background(Color("SearchBarBackground"))
        .cornerRadius(30)
        //.padding(.bottom, 12)
    }
}

#Preview {
    MessageBar(placeholder: "Digite uma mensagem", messageText: .constant(""))
}
