//
//  APIService.swift
//  TribunNews
//
//  Created by Andira Yunita on 14/02/24.
//

import Foundation
import Alamofire

class APIService {
    static let shared = APIService()
    private init() { }
    
    func fetchNewsJakarta() async throws -> [News] {
        let urlString = Constants.jakartaNewsUrl
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        // Continuation
        let news = try await withCheckedThrowingContinuation { continuation in
            AF.request(url).responseDecodable(of: NewsResponse.self) { response in
                switch response.result {
                case .success(let newsResponse):
                    continuation.resume(returning: newsResponse.data)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
        
        return news
    }
}
