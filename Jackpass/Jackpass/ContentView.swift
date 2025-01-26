//
//  ContentView.swift
//  Jackpass
//
//  Created by Praveen Sehgal on 24/01/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            EventListView()
                .navigationTitle("Events")
        }
    }
}

#Preview {
    ContentView()
}
