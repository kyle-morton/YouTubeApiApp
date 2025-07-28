//
//  Playlist.swift
//  YouTubeApiApp
//
//  Created by Kyle Morton on 7/25/25.
//

import Foundation

struct PlaylistResponse : Decodable {
    var items: [Video]
}
