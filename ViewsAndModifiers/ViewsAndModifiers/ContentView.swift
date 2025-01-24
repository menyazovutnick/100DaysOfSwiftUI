//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Nick Khachatryan on 24.01.2025.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
                
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }

}

#Preview {
    ContentView()
}
