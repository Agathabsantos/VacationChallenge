//
//  WarningCard.swift
//  VacationChallenge
//
//  Created by Agatha Barbosa Marinho dos Santos on 23/07/26.
//

import SwiftUI

struct WarningCard: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 6) {
            HStack (spacing: 4){
                Image(systemName: "info.circle")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Color("WarningCardIconColor"))
                
                Text("Selecione um contato")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(Color("WarningCardTitleColor"))
            }
            
            Text("Escolha um contato para iniciar uma nova conversa")
                .font(.system(size: 12, weight: .regular))
                .padding(.leading, 4)
                .foregroundColor(Color("WarningCardTextColor"))
                
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .frame(maxWidth: .infinity)
        .background(Color("WarningCardBackGround"))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color("WarningCardBorder"), lineWidth: 1)
        )
    }
}


#Preview {
    WarningCard()
}
