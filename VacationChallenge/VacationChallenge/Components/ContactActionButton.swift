//
//  ContactActionButton.swift
//  VacationChallenge
//
//  Created by Agatha Barbosa Marinho dos Santos on 23/07/26.
//

import SwiftUI

struct ContactActionButton: View {
    let title: String
    let systemImage: String?
    let action: () -> Void

    init(
        title: String,
        systemImage: String? = nil,
        action: @escaping () -> Void
        
    ) {
        self.title = title
        self.systemImage = systemImage
        self.action = action
    }
   
    var body: some View {
        Button (action: action) {
            HStack (spacing: 10) {
                if let systemImage {
                    Image(systemName: systemImage)
                        .font(.system(size: 18, weight: .medium))
                }
                
                Text(title)
                    .font(.system(size: 18, weight: .regular))
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 44)
            .background(Color("PrimaryColor"))
            .clipShape(Capsule())
         
        }
    }
}

#Preview {
    HStack {
        ContactActionButton(
            title: "Novo contato",
            systemImage: "plus",
            action: {}
        )
        
        ContactActionButton(
            title: "Novo grupo",
            systemImage: "person.2",
            action: {}
        )
    }
    ContactActionButton(
        title: "Iniciar conversa",
        action: {}
    )
    
}
