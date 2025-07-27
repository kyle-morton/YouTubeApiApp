//
//  VideoDetailView.swift
//  YouTubeApiApp
//
//  Created by Kyle Morton on 7/25/25.
//

import SwiftUI

struct VideoDetailView: View {
    
    var video: Video
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // Video player
            
            // Title and description
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    Text(video.snippet?.title ?? "")
                        .font(.headline)
                        .bold()
                    
                    Text(video.snippet?.description ?? "")
                }
            }
            .scrollIndicators(.hidden)
            .padding()
        }
    }
}

//#Preview {
//    VideoDetailView(video: Video(id: "123"))
//    Spacer()
//}
