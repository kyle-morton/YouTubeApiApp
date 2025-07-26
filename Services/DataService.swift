//
//  DataService.swift
//  YouTubeApiApp
//
//  Created by Kyle Morton on 7/25/25.
//

import Foundation

struct DataService {
    private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func getVideos() async -> [Video] { // eventually ask for playlist ID, max results?
        
        // bail if we don't have our API key
        guard apiKey != nil else {
            return [Video]()
        }
        
        let playlistId = "PLY5YZGatmhWYjWpjG-nA5f3oFPL2gpM1G" // Funhaus Series
        let maxResults = 50
        
        // Check if API key is present
        let urlString = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=\(maxResults)&playlistId=\(playlistId)&key=\(apiKey!)"
        let url = URL(string: urlString)
        
        // Create Url
        if let url = url { // only create req if the url is not nil (null)
            let request = URLRequest(url: url)
            let session = URLSession.shared
            
            // session.data request could throw an error (hence the do/catch and try) and it's async (hence the await)
            do {
                
                let (data, _) = try await session.data(for: request)
                
                // Parse the data
                let decoder = JSONDecoder()
                let playlist = try decoder.decode(Playlist.self, from: data)
                
                return playlist.items
                
            } catch {
                print(error)
            }
            
        }
        
        

        // Create the request
        
        // send the req
        
        
        
        return [Video]()
    }
}
