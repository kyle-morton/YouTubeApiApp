//
//  Snippet.swift
//  YouTubeApiApp
//
//  Created by Kyle Morton on 7/27/25.
//


struct Snippet : Decodable {
    var title: String? // ? here represents an optional prop (could be nil)
    var description: String?
    var thumbnails: Thumbnails?
    var resourceId: ResourceId?
}
