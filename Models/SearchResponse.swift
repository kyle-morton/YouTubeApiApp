//
//  Temp.swift
//  YouTubeApiApp
//
//  Created by Kyle Morton on 7/27/25.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

struct SearchResponse: Decodable {
//    let pageInfo: PageInfo
//    let etag, kind: String
    var items: [SearchItem]
    var nextPageToken, regionCode: String
}








