//
//  ScrollOffsetPreferenceKey.swift
//  VacationChallenge
//
//  Created by Agatha Barbosa Marinho dos Santos on 26/07/26.
//

import SwiftUI

// PreferenceKey é usada para compartilhar a posição atual do ScrollView entre diferentes componentes da interface
struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

// View invisível responsável por capturar a posição do ScrollView utilizando GeometryReader e PreferenceKey
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

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

extension View {
    func measureSize(_ onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geo in
                Color.clear.preference(key: SizePreferenceKey.self, value: geo.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}
