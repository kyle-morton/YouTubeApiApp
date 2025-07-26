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
        HStack {
            
            if let url = URL(string: video.snippet?.thumbnails?.medium?.url ?? "") {
                AsyncImage(url: url) { image in
                    // Image that's displayed after pulled
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                } placeholder: {
                    ProgressView()
                }
            }
//            
//            Text(video.snippet?.title ?? "No Title")
//                .listRowSeparator(.hidden)
        }

    }
}

#Preview {
    VideoRowView(video: Video(id: "123"))
    Spacer()
}
