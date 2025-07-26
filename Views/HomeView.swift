//
//  ContentView.swift
//  YouTubeApiApp
//
//  Created by Kyle Morton on 7/25/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            FeedView()
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
