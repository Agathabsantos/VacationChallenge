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
        .background(Color("SearchBarBackground"))
        .cornerRadius(30)
        .padding(.bottom, 12)
    }
}

#Preview {
    SearchBar(placeholder: "Buscar conversas", searchText: .constant(""))
}
