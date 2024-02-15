//
//  AsyncImageView.swift
//  TribunNews
//
//  Created by Andira Yunita on 15/02/24.
//

import SwiftUI

struct AsyncImageView: View {
    var news: News
    var body: some View {
        Group {
            if let url = URL(string: news.image) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        EmptyView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    case .failure( _):
                        ZStack {
                            Rectangle()
                                .foregroundStyle(Color.gray)
                            Image(systemName: "photo.on.rectangle.angled")
                                .font(.title)
                                .foregroundStyle(.white)
                        }
                    @unknown default:
                        fatalError()
                    }
                }
            }
        }
    }
}

#Preview {
    AsyncImageView(news: News(
        title: "Anies-Muhaimin Tumbang di TPS 161, Tempat Menteri PUPR Basuki Hadimoeljono Nyoblos",
        link: "https://jakarta.tribunnews.com/2024/02/14/anies-muhaimin-tumbang-di-tps-161-tempat-menteri-pupr-basuki-hadimoeljono-nyoblos",
        contentSnippet: "TPS 161 merupakan lokasi Menteri Pekerjaan Umum dan Perumahan Rakyat (PUPR), Basuki Hadimuljono menggunakan hak suaranya.",
        isoDate: "2024-02-14T14:33:57.000Z",
        image: "https://asset-2.tstatic.net/jakarta/foto/bank/images/Pasangan-calon-Presiden-Capres-Anies-Baswedan-Muhaimin-Iskanda.jpg"))
}
