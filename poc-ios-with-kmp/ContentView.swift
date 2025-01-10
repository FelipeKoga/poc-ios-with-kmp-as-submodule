//
//  ContentView.swift
//  poc-ios-with-kmp
//
//  Created by Felipe Koga on 09/01/25.
//

import SwiftUI
import shared

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(Greeting().greet())
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
