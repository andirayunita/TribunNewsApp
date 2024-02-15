//
//  TribunNews.swift
//  TribunNews
//
//  Created by Andira Yunita on 15/02/24.
//

import SwiftUI

struct TribunNews: View {
    @StateObject private var viewModel = NewsViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 20) {
                    ScrollView(.horizontal) {
                        HStack(spacing: 16) {
                            ForEach(viewModel.news) { news in
                                NavigationLink(destination: WebView(url: URL(string: news.link)!)) {
                                    NewsCard(news: news)
                                        .tint(.black)
                                }
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    
                    Text("For Your News")
                        .font(.system(.subheadline, weight: .bold))
                    
                    ScrollView(.vertical) {
                        ForEach(viewModel.news) { news in
                            NavigationLink(destination: WebView(url: URL(string: news.link)!)) {
                                NewsRowCard(news: news)
                                    .tint(.black)
                            }
                            Divider().padding(.vertical, 8)
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                .task {
                    await viewModel.loadNews()
                }
                .padding(.horizontal, 16)
            }
            .navigationTitle(Constants.ViewTitles.newsTitle)
            .scrollIndicators(.hidden)
            .overlay {
                switch viewModel.loadingOverlay {
                case .loading:
                    ProgressView().scaleEffect(2).tint(.gray)
                case .error(let message):
                    Text(message)
                        .font(.caption)
                        .foregroundStyle(.red)
                case .none:
                    EmptyView()
                }
            }
            .refreshable {
                await viewModel.loadNews()
            }
        }
    }
}

#Preview {
    TribunNews()
}
