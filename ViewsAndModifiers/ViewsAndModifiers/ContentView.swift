//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Nick Khachatryan on 24.01.2025.
//

import SwiftUI

struct LargeTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func largeTitle() -> some View {
        self.modifier(LargeTitle())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Custom ViewModifier")
            .largeTitle()
    }
}

#Preview {
    ContentView()
}
