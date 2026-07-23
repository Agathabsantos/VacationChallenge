//
//  TypingIndicator.swift
//  VacationChallenge
//
//  Created by Agatha Barbosa Marinho dos Santos on 22/07/26.
//

import SwiftUI

struct TypingIndicator: View {
    var body: some View {
        //alguem digitando
        HStack {
            HStack {
                Circle()
                    .frame(width: 6, height: 6)
                    .opacity(0.40)
                Circle()
                    .frame(width: 6, height: 6)
                    .opacity(0.75)
                Circle()
                    .frame(width: 6, height: 6)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
            .foregroundStyle(.white)
            .background(Color("ReceiveMessageBallomColor"))
            .clipShape(RoundedRectangle(cornerRadius: 16))
                
            Spacer()
        }
    }
}

#Preview {
    TypingIndicator()
}
