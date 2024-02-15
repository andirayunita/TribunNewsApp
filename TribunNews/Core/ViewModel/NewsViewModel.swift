//
//  NewsViewModel.swift
//  TribunNews
//
//  Created by Andira Yunita on 15/02/24.
//

import Foundation

@MainActor
class NewsViewModel: ObservableObject {
    @Published var news = [News]()
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func loadNews() async {
        isLoading = true
        defer { isLoading = false }
        errorMessage = nil
        
        do {
            news = try await APIService.shared.fetchNewsJakarta()
        } catch {
            errorMessage = "‼️ Failed to fetch news from API: \(error.localizedDescription)"
            print(error)
        }
    }
    
    enum LoadingOverlayState {
        case loading
        case error(String)
        case none
    }
    
    var loadingOverlay: LoadingOverlayState {
        if isLoading {
            return .loading
        } else if let errorMessage = errorMessage, !errorMessage.isEmpty {
            return .error(errorMessage)
        } else {
            return .none
        }
    }
}
