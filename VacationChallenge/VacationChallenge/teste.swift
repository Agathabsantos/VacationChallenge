//
//  teste.swift
//  VacationChallenge
//
//  Created by Agatha Barbosa Marinho dos Santos on 20/07/26.
//

import SwiftUI

struct ChatViews: View {
    @State private var mensagens: [String] = Array(repeating: "Mensagem de teste no histórico de chat", count: 25)
    @State private var textoDigitado: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(0..<mensagens.count, id: \.self) { index in
                        Text("\(mensagens[index]) #\(index)")
                            .padding()
                            .background(Color.blue.opacity(0.15))
                            .cornerRadius(12)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Conversa")
            .navigationBarTitleDisplayMode(.inline)
            // 1. Garante que o conteúdo role por trás de toda a área segura (topo e base)
            .ignoresSafeArea(.keyboard, edges: .bottom)
            
            // 2. Insere a barra de digitação na base da área segura de forma nativa
            .safeAreaInset(edge: .bottom) {
                HStack {
                    TextField("Digite sua mensagem...", text: $textoDigitado)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Enviar") {
                        if !textoDigitado.isEmpty {
                            mensagens.append(textoDigitado)
                            textoDigitado = ""
                        }
                    }
                }
                .padding()
                // 3. Aplica o Material Padrão (Standard Material) recomendado pela Apple
                .background(.ultraThinMaterial)
                // 4. Adiciona uma linha sutil divisória para separar o conteúdo, comum no iOS
                .overlay(alignment: .top) {
                    Divider()
                }
            }
        }
    }
}

#Preview {
    ChatViews()
}
