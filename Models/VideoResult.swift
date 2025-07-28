//
//  Video.swift
//  YouTubeApiApp
//
//  Created by Kyle Morton on 7/27/25.
//

import Foundation


struct VideoResult : Identifiable {
    
    var id: String?
    var snippet: Snippet?
    
    init(id: String? = nil, snippet: Snippet? = nil) {
        self.id = id
        self.snippet = snippet
    }
    
    func getThumbnailUrl() -> String {
        return snippet?.thumbnails?.high?.url ??
        snippet?.thumbnails?.medium?.url ??
        snippet?.thumbnails?.standard?.url ??
        snippet?.thumbnails?.maxres?.url
        ?? "";
    }
    
    func getVideoUrl() -> String {
        return "https://www.youtube.com/watch?v=\(id!)"
    }
}
