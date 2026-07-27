//
//  ContactCard.swift
//  VacationChallenge
//
//  Created by Agatha Barbosa Marinho dos Santos on 23/07/26.
//

import SwiftUI

struct ContactCard: View {
    let avatarImage: String
    let userName: String
    let status: String
    let isOnline: Bool
    @Binding var isSelected: Bool
    
    var body: some View {
        HStack {
            Image(avatarImage)
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            
            VStack (alignment: .leading, spacing: 4) {
                Text(userName)
                    .font(.system(size: 22, weight: .regular))
                    .foregroundStyle(Color("UserName"))
                
                HStack(spacing: 4) {
                    Circle()
                        .fill(isOnline ? Color("CircleStatusColor") : .gray)
                        .frame(width: 10, height: 10)

                    Text(status)
                        .font(.system(size: 16))
                        .foregroundStyle(Color("TextStatus"))
                }
            }
            
            Spacer()
            
            Button {
                isSelected.toggle()
            } label: {
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 28))
                        .foregroundStyle(.white, Color("PrimaryColor"))
                } else {
                    Circle()
                        .stroke(Color("SelectedContactBorder"),
                                lineWidth: 2)
                        .fill(Color("SelectedContactFill"))
                        .frame(width: 28, height: 28)
                        
                }
            }
            .buttonStyle(.plain)
            .frame(width: 44, height: 44)
            
        }
        .padding(.vertical, 12)
        
        Rectangle()
            .fill(Color("DividerColor"))
            .frame(height: 2)
    }
}

#Preview {
    @Previewable @State var isFirstSelected = false
    @Previewable @State var isSecondSelected = true
    VStack {

        ContactCard(
            avatarImage: "Avatar1",
            userName: "Agatha Santos",
            status: "online",
            isOnline: true,
            isSelected: $isFirstSelected
        )

        ContactCard(
            avatarImage: "Avatar2",
            userName: "Guilherme Sales",
            status: "offline",
            isOnline: false,
            isSelected: $isSecondSelected
        )

    }
    .padding()
    .background(Color("Background"))
}
