//
//  SearchBar.swift
//  VacationChallenge
//
//  Created by Agatha Barbosa Marinho dos Santos on 20/07/26.
//

import SwiftUI

struct SearchBar: View {
    
    let placeholder: String
    @Binding var searchText: String
    var isScrolled: Bool = false
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color("SearchBarText"))
                .font(.system(size: 17))
                
            TextField(
                text: $searchText,
                prompt: Text(placeholder)
                    .foregroundColor(Color("SearchBarText"))
                    .font(.system(size: 17))
            ){
            }
            .foregroundStyle(Color("SearchBarText"))
                
            
            Image(systemName: "microphone.fill")
                .foregroundStyle(Color("SearchBarText"))
                .font(.system(size: 17))
        }
        .padding(.horizontal, 12)
        .frame(height: 44)
        
        // altera a aparência da barra de pesquisa quando o cabeçalho recebe o efeito ultraThinMaterial durante a rolagem
        .background {
            RoundedRectangle(cornerRadius: 14)
                // ajusta  a cor para manter contraste tanto no modo claro quanto no escuro
                .fill(
                    isScrolled
                    ? (
                        colorScheme == .dark
                        ? Color.white.opacity(0.10)
                        : Color.white.opacity(0.92)
                    )
                    : Color("SearchBarBackground")
                ).cornerRadius(30)
                
                .overlay(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .strokeBorder(
                            colorScheme == .dark
                            ? Color.white.opacity(isScrolled ? 0.12 : 0)
                            : Color.black.opacity(isScrolled ? 0.08 : 0),
                            lineWidth: 0.8
                        )
                )
            
                .shadow(
                    color: .black.opacity(isScrolled ? 0.08 : 0),
                    radius: 8,
                    x: 0,
                    y: 2
                )
        }
        .padding(.bottom, 12)
        .animation(.easeInOut(duration: 0.2), value: isScrolled)
    }
}

#Preview {
    SearchBar(placeholder: "Buscar conversas", searchText: .constant(""))
}
