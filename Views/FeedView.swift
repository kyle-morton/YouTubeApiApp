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
        List(videos) { video in
            Text(video.snippet?.title ?? "No Title")
        }
        .task { // lets you run an async section of code as a background worker
            let videos = await DataService().getVideos()
            self.videos = videos
        }
    }
}

#Preview {
    FeedView()
}
