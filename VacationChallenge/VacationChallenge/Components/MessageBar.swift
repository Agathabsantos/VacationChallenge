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
    @Environment(\.colorScheme) private var colorScheme
    
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
        
        // mantém contraste semelhante ao da SearchBar, modo claro ou escuro
        .background {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(
                    colorScheme == .dark
                    ? Color.white.opacity(0.10)
                    : Color.white.opacity(0.92)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .strokeBorder(
                            colorScheme == .dark
                            ? Color.white.opacity(0.12)
                            : Color.black.opacity(0.08),
                            lineWidth: 0.8
                        )
                )
                .shadow(
                    color: .black.opacity(0.08),
                    radius: 8,
                    x: 0,
                    y: 2
                )
        }
    }
}

#Preview {
    MessageBar(placeholder: "Digite uma mensagem", messageText: .constant(""))
}
