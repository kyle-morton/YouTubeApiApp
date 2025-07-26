//
//  DataService.swift
//  YouTubeApiApp
//
//  Created by Kyle Morton on 7/25/25.
//

import Foundation

struct DataService {
    private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func getVideos() async -> [Video] { // eventually ask for playlist ID
        
        // bail if we don't have our API key
        guard apiKey != nil else {
            return [Video]()
        }
        
//        let playlistId = "PLMRqhzcHGw1bXAOgzO8HokHyq9vmSeq1L" // Code with Chris
        let playlistId = "PLY5YZGatmhWYjWpjG-nA5f3oFPL2gpM1G" // Funhaus Series
        
        // Check if API key is present
        let urlString = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(playlistId)&key=\(apiKey!)"
        let url = URL(string: urlString)
        
        // Create Url
        if let url = url { // only create req if the url is not nil (null)
            let request = URLRequest(url: url)
            let session = URLSession.shared
            
            
            // session.data request could throw an error (hence the do/catch and try) and it's async (hence the await)
            do {
                
                let (data, response) = try await session.data(for: request)
                
                print(data)
                print(response)
                // Parse the data
                
            } catch {
                print(error)
            }
            
        }
        
        

        // Create the request
        
        // send the req
        
        
        
        return [Video]()
    }
}
