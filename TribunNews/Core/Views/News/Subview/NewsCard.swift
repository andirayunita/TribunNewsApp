//
//  NewsCard.swift
//  TribunNews
//
//  Created by Andira Yunita on 15/02/24.
//

import SwiftUI

struct NewsCard: View {
    var news: News
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            AsyncImageView(news: news)
                .frame(width: 200, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text(news.title)
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .lineLimit(2, reservesSpace: true)
                .multilineTextAlignment(.leading)
        }
        .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 170)
    }
}

#Preview {
    NewsCard(news: News(
        title: "Anies-Muhaimin Tumbang di TPS 161, Tempat Menteri PUPR Basuki Hadimoeljono Nyoblos",
        link: "https://jakarta.tribunnews.com/2024/02/14/anies-muhaimin-tumbang-di-tps-161-tempat-menteri-pupr-basuki-hadimoeljono-nyoblos",
        contentSnippet: "TPS 161 merupakan lokasi Menteri Pekerjaan Umum dan Perumahan Rakyat (PUPR), Basuki Hadimuljono menggunakan hak suaranya.",
        isoDate: "2024-02-14T14:33:57.000Z",
        image: "https://asset-2.tstatic.net/jakarta/foto/bank/images/Pasangan-calon-Presiden-Capres-Anies-Baswedan-Muhaimin-Iskanda.jpg"))
}
