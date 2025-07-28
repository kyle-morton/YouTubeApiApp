//
//  FeedView.swift
//  YouTubeApiApp
//
//  Created by Kyle Morton on 7/25/25.
//

import SwiftUI

struct FeedView: View {
    
    @State private var videos: [VideoResult] = []
    @State private var selectedVideo: VideoResult?
    
    var body: some View {
        List(videos) { video in
            if (video.getThumbnailUrl() != "") {
                VideoRowView(video: video)
                    .onTapGesture {
                        selectedVideo = video
                    }
            }
        }
        .listStyle(.plain)
        .scrollIndicators(.hidden)
        .padding(.horizontal)
        .task { // lets you run an async section of code as a background worker
            let videos = await DataService().getPlaylistVideos()
            self.videos = videos
        }
        .sheet(item: $selectedVideo) { selectedVid in // opened whenever this var has a value
            VideoDetailView(video: selectedVid)
        }
    }
}

#Preview {
    FeedView()
}
