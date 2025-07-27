//
//  Video.swift
//  YouTubeApiApp
//
//  Created by Kyle Morton on 7/25/25.
//

import Foundation

struct Video : Decodable, Identifiable {
    // Decodable - Protocol - allows us to deserialize json into this type
    // Identifiable - Protocol - allows us to use this type in a swift UI list
    var id: String
    var snippet: Snippet?
    
    func getThumbnailUrl() -> String {
        return snippet?.thumbnails?.high?.url ??
        snippet?.thumbnails?.medium?.url ??
        snippet?.thumbnails?.standard?.url ??
        snippet?.thumbnails?.maxres?.url
        ?? "";
    }
    
    func getVideoUrl() -> String {
        return "https://www.youtube.com/watch?v=\(id)"
    }
}








