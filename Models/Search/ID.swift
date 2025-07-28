//
//  ID.swift
//  YouTubeApiApp
//
//  Created by Kyle Morton on 7/27/25.
//


struct ID: Codable {
    let kind: IDKind?
    let videoID: String?

    enum CodingKeys: String, CodingKey {
        case kind
        case videoID = "videoId"
    }
}