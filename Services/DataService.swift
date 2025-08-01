//
//  DataService.swift
//  YouTubeApiApp
//
//  Created by Kyle Morton on 7/25/25.
//

import Foundation

struct DataService {
    
    private let baseUrlString = "https://youtube.googleapis.com/youtube/v3"
    private let maxResults = 50
    
    private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func buildUrl(apiKey: String, playlistId: String?, videoSearchTerm: String?) -> String? {
        
        if (playlistId != nil) {
            return "\(baseUrlString)/playlistItems?part=snippet&maxResults=\(maxResults)&playlistId=\(playlistId!)&key=\(apiKey)"
        }
        
        // search videos
        return "\(baseUrlString)/search?part=snippet&maxResults=\(maxResults)&type=video&q=SEARCH_QUERY=\(videoSearchTerm!)&key=\(apiKey)"
    }
    
    func searchVideos(videoSearchTerm: String) async -> [VideoResult] {
        // bail if we don't have our API key
        guard apiKey != nil else {
            return [VideoResult]()
        }
        
        let urlString = buildUrl(apiKey: apiKey!, playlistId: nil as String?, videoSearchTerm: videoSearchTerm)!
        let url = URL(string: urlString)
        
        if let url = url {
            let request = URLRequest(url: url)
            let session = URLSession.shared
            
            // session.data request could throw an error (hence the do/catch and try) and it's async (hence the await)
            do {
                
                let (data, _) = try await session.data(for: request)
                
                // Parse the data
                let decoder = JSONDecoder()
                let videoResponse = try decoder.decode(SearchResponse.self, from: data)
                
                // Map items to generic video response array
                let videoResults = videoResponse.items.map { item in
                    VideoResult(id: item.id?.videoID, snippet: item.snippet)
                }
                
                return videoResults
                
            } catch {
                print(error)
            }
        }
        
        return [VideoResult]()
    }
    
    func getPlaylistVideos() async -> [VideoResult] { // eventually ask for playlist ID
        
        // bail if we don't have our API key
        guard apiKey != nil else {
            return [VideoResult]()
        }
        
        let playlistId = "PLY5YZGatmhWYjWpjG-nA5f3oFPL2gpM1G" // Funhaus Series
        
        // Check if API key is present
//        let urlString = "\(baseUrlString)/playlistItems?part=snippet&maxResults=\(maxResults)&playlistId=\(playlistId)&key=\(apiKey!)"
        let urlString = buildUrl(apiKey: apiKey!, playlistId: playlistId, videoSearchTerm: nil as String?)!
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
                let videoResponse = try decoder.decode(PlaylistResponse.self, from: data)
                
                let videoResults = videoResponse.items.map { item in
                    VideoResult(id: item.snippet?.resourceId?.videoId, snippet: item.snippet)
                }
                
                return videoResults
                
            } catch {
                print(error)
            }
            
        }

        return [VideoResult]()
    }
}
