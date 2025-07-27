//
//  DebounceTextField.swift
//  YouTubeApiApp
//
//  Created by Kyle Morton on 7/27/25.
//

import SwiftUI
import Combine

struct DebounceTextField: View {
    @Binding var debouncedText: String
    @StateObject private var viewModel = SearchViewModel()

    var body: some View {
        VStack(spacing: 20) {
            TextField("Search...", text: $viewModel.searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
        .onReceive(viewModel.$debouncedText) { value in
            debouncedText = value
        }
    }
}

class SearchViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var debouncedText: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $searchText
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] value in
                self?.debouncedText = value
//                print("Debounced: \(value)")
            }
            .store(in: &cancellables)
    }
}

#Preview {
    @Previewable @State var text: String = ""
    DebounceTextField(debouncedText: $text)
    Text("Debounced: \(text)")
    Spacer()
}
