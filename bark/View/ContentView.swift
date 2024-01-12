//
//  ContentView.swift
//  bark
//
//  Created by Anagha K J on 12/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            }
        }
}

#Preview {
    ContentView()
}
