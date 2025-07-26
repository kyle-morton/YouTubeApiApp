//
//  FeedView.swift
//  YouTubeApiApp
//
//  Created by Kyle Morton on 7/25/25.
//

import SwiftUI

struct FeedView: View {
    
    @State private var videos: [Video] = []
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .task { // lets you run an async section of code as a background worker
                self.videos = await DataService().getVideos()
            }
    }
}

#Preview {
    FeedView()
}
