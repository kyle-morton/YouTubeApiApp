//
//  VideoRowView.swift
//  YouTubeApiApp
//
//  Created by Kyle Morton on 7/25/25.
//

import SwiftUI

struct VideoRowView: View {
    
    var video : Video
    
    var body: some View {
        VStack(alignment: .leading) {
            if let url = URL(string: video.getThumbnailUrl()) {
                AsyncImage(url: url) { image in
                    // Image that's displayed after pulled
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                } placeholder: {
                    ProgressView()
                }
            }
            Text(video.snippet?.title ?? "N/A")
                .bold()
//            Text(video.getThumbnailUrl())
//                .bold()
        }

    }
}

#Preview {
    VideoRowView(video: Video(id: "123"))
    Spacer()
}
