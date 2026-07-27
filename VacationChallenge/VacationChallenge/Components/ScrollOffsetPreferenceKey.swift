//
//  ScrollOffsetPreferenceKey.swift
//  VacationChallenge
//
//  Created by Agatha Barbosa Marinho dos Santos on 26/07/26.
//

import SwiftUI

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct ScrollOffsetReader: View {
    var onChange: (CGFloat) -> Void
    
    var body: some View {
        GeometryReader { geo in
            Color.clear
                .preference(
                    key: ScrollOffsetPreferenceKey.self,
                    value: geo.frame(in: .named("SCROLL")).minY
                )
        }
        .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
            onChange(value)
        }
    }
}

