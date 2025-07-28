//
//  VideoDetailView.swift
//  YouTubeApiApp
//
//  Created by Kyle Morton on 7/25/25.
//

import SwiftUI
import YouTubePlayerKit

struct VideoDetailView: View {
    
    var video: VideoResult
    
    
    var body: some View {
        
        // Use this to figure out how much space you have on device to accurately display the video
        // Reads size of the device viewport
        GeometryReader { proxy in
            
            VStack(alignment: .leading) {
                
                // configuree video player
                let youTubePlayer = YouTubePlayer(
                    source: .video(id: video.snippet?.resourceId?.videoId ?? ""),
                    parameters: .init(
                        autoPlay: false
                    )
                )
                
                // display video
                YouTubePlayerView(youTubePlayer)
                    .frame(
                        width:proxy.size.width,
                        height: proxy.size.width / 1.77778 // set as ratio of the width (thumbnail is 320x180, 320/180 = 1.77778)
                    )

                
                // Title and description
                ScrollView {
                    VStack(alignment: .leading, spacing: 30) {
                        Text(video.snippet?.resourceId?.videoId ?? "")
                        
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
}

//#Preview {
//    VideoDetailView(video: Video(id: "123"))
//    Spacer()
//}
