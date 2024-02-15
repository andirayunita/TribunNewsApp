//
//  MainTabView.swift
//  TribunNews
//
//  Created by Andira Yunita on 15/02/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            TribunNews()
                .tabItem {
                    Label("News", systemImage: "newspaper.circle")
                }
            
            // MARK: - Search Page
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.yellow)
                Text("Search Functions")
            }
            .tabItem {
                Label("Search", systemImage: "magnifyingglass.circle")
            }
            
            // MARK: - Settings Page
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.indigo)
                Text("Settings Page")
            }
            .tabItem {
                Label("Settings", systemImage: "gear.circle")
            }
        }
        .tint(.blue)
    }
}

#Preview {
    MainTabView()
}
