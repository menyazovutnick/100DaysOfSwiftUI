//
//  ContentView.swift
//  Animations
//
//  Created by Nick Khachatryan on 10.02.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
    var body: some View {
        VStack {
            Button("Tap me") {
                withAnimation {
                    animationAmount += 360
                }
                
            }
            .padding(50)
            .background(.red)
            .clipShape(.circle)
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 1, y: 1, z: 0))
        }
    }
}

#Preview {
    ContentView()
}
