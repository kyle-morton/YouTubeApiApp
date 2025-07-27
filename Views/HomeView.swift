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
                    .tabItem{
                        Image(systemName: "play.square.stack")
                        Text("Feed")
                    }
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
            }
            .ignoresSafeArea()        
    }
}

#Preview {
    HomeView()
}
