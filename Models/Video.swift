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

struct Snippet : Decodable {
    var title: String? // ? here represents an optional prop (could be nil)
    var description: String?
    var thumbnails: Thumbnails?
    var resourceId: ResourceId?
}

struct ResourceId : Decodable {
    var videoId: String?
}

struct Thumbnails : Decodable {
    var maxres: ThumbnailSize?
    var medium: ThumbnailSize?
    var high: ThumbnailSize?
    var standard: ThumbnailSize?
}

struct ThumbnailSize : Decodable {
    var url: String?
    var width: Int
    var height: Int
}
