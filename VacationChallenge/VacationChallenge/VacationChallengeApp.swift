//
//  VacationChallengeApp.swift
//  VacationChallenge
//
//  Created by Agatha Barbosa Marinho dos Santos on 19/07/26.
//

import SwiftUI

@main
struct VacationChallengeApp: App {
    
    @State private var showSplash = true //controla a exibição da Splash Screen ao iniciar o app
    
    var body: some Scene {
        WindowGroup {
            
            if showSplash {

                SplashView()
                    .onAppear {
                        // exibe a Splash Screen por 2 segundos antes de navegar para a tela principal do app
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                showSplash = false
                            }
                        }

                    }

            } else {
                NavigationStack {
                    ConversationsView()
                }
                .ignoresSafeArea(.keyboard, edges: .all)
            }
            
            
        }
    }
}

