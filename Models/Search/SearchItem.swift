//
//  SearchItem.swift
//  YouTubeApiApp
//
//  Created by Kyle Morton on 7/27/25.
//


struct SearchItem: Decodable {
    let etag: String?
    let kind: ItemKind?
    let id: ID?
    let snippet: Snippet?
}
