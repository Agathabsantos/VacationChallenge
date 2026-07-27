//
//  AlphabetIndex.swift
//  VacationChallenge
//
//  Created by Agatha Barbosa Marinho dos Santos on 23/07/26.
//

import SwiftUI

struct AlphabetIndex: View {
    
    private let letters = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    
    var body: some View {
        VStack(spacing: 2) {

            ForEach(letters, id: \.self) { letter in

                Button {
                    //acao
                } label: {
                    Text(String(letter))
                        .font(.system(size: 11, weight: .regular))
                        .foregroundStyle(Color("PrimaryColor"))
                }
            
            }
            
        }
        
    }
}
