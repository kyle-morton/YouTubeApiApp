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
        .onAppear(perform: {
            print(Bundle.main.infoDictionary?["API_KEY"] as? String
                  ?? "Cant find it!")
        })
    }
}

#Preview {
    HomeView()
}
