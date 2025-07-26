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
}

struct Snippet : Decodable {
    var title: String? // ? here represents an optional prop (could be nil)
    var description: String?
    var thumbnails: Thumbnails?
    var resourceid: ResourceId?
}

struct ResourceId : Decodable {
    var videoId: String?
}

struct Thumbnails : Decodable {
    var medium: ThumbnailSize?
}

struct ThumbnailSize : Decodable {
    var url: String?
    var width: Int
    var height: Int
}
