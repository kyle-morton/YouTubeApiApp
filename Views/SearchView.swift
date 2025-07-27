//
//  SearchView.swift
//  YouTubeApiApp
//
//  Created by Kyle Morton on 7/27/25.
//

import SwiftUI
import Combine

struct SearchView: View {
    
    @State var searchTerm:String = ""
    @State var videos : [Video] = []
    private var dataService = DataService()
    
    
    var body: some View {
        VStack {
            HStack {
                Text("Search")
                    .font(.headline)
                    .bold()
                Image(systemName: "magnifyingglass")
            }
            HStack {
                TextField("Search...", text: $searchTerm)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button {
                    Task{
                        self.videos = await self.dataService.searchVideos(videoSearchTerm: self.searchTerm)
                    }
                } label: {
                    Image(systemName: "magnifyingglass")
                }.buttonStyle(.bordered)
            }
            List(videos) { video in
                VideoRowView(video: video)
            }
        }
        .padding(.horizontal)
        
    }
}


// Using debounce - probably not safe for external API
//struct SearchView: View {
//    
//    @State var searchTerm:String = ""
//    private var dataService = new DataService()
//    
//    
//    var body: some View {
//        VStack {
//            HStack {
//                Text("Search")
//                    .font(.headline)
//                    .bold()
//                Image(systemName: "magnifyingglass")
//            }
//            DebounceTextField(debouncedText: $searchTerm)
//                .onChange(of: $searchTerm) { oldValue, newValue in
//                    
//                }
//            Text("Search triggered with: \(searchTerm)")
//        }
//        .padding(.horizontal)
//        .onChange(of: searchTerm) { search in
//            Task {
//                if (d)
//                await performSearch(query: newQuery)
//            }
//        }
//        
//    }
//}

#Preview {
    SearchView()
    Spacer()
}
