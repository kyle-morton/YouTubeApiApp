//
//  Thumbnails.swift
//  YouTubeApiApp
//
//  Created by Kyle Morton on 7/27/25.
//


struct Thumbnails : Decodable {
    var maxres: ThumbnailSize?
    var medium: ThumbnailSize?
    var high: ThumbnailSize?
    var standard: ThumbnailSize?
}