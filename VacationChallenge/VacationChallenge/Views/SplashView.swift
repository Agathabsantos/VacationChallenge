//
//  SplashView.swift
//  VacationChallenge
//
//  Created by Agatha Barbosa Marinho dos Santos on 23/07/26.
//

import SwiftUI

struct SplashView: View {

    var body: some View {
        ZStack {
            Color("SecondaryColor")
                .ignoresSafeArea()

            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 180)
        }
    }
}

#Preview {
    SplashView()
}
