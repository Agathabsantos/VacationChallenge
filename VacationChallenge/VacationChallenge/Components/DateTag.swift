//
//  DateTag.swift
//  VacationChallenge
//
//  Created by Agatha Barbosa Marinho dos Santos on 22/07/26.
//

import SwiftUI

struct DateTag: View {
    let text: String

    var body: some View {
        //Tag de data
        Text(text)
            .font(.system(size: 13, weight: .medium))
            .foregroundStyle(Color("HourOfConversation"))
            .padding(.horizontal, 16)
            .padding(.vertical, 6)
            .background(Color("HourTagOfConversation"))
            .clipShape(Capsule())
            .padding(.top, 4)
    }
}

#Preview {
    VStack {
        DateTag(text: "hoje")
        DateTag(text: "ontem")
        DateTag(text: "20/07/2026")
    }
}
