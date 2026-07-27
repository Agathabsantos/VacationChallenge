//
//  VacationChallengeApp.swift
//  VacationChallenge
//
//  Created by Agatha Barbosa Marinho dos Santos on 19/07/26.
//

import SwiftUI

@main
struct VacationChallengeApp: App {
    
    @State private var showSplash = true
    
    var body: some Scene {
        WindowGroup {
            
            if showSplash {

                SplashView()
                    .onAppear {

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
            }
            
            
        }
    }
}

