//
//  NewsRowCard.swift
//  TribunNews
//
//  Created by Andira Yunita on 15/02/24.
//

import SwiftUI

struct NewsRowCard: View {
    var news: News
    var body: some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 5) {
                Text(news.title)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                
                Text(news.contentSnippet)
                    .font(.system(size: 10))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                HStack(spacing: 5) {
                    Image(systemName: "clock")
                        .foregroundStyle(.gray)
                        .font(.system(size: 10))
                    Text(news.isoDate.formattedDateRelativeToCurrent())
                        .font(.system(size: 8))
                        .foregroundStyle(.gray)
                }
            }
            
            AsyncImageView(news: news)
                .frame(width: 120, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    NewsRowCard(news: News(
        title: "Anies-Muhaimin Tumbang di TPS 161, Tempat Menteri PUPR Basuki Hadimoeljono Nyoblos",
        link: "https://jakarta.tribunnews.com/2024/02/14/anies-muhaimin-tumbang-di-tps-161-tempat-menteri-pupr-basuki-hadimoeljono-nyoblos",
        contentSnippet: "TPS 161 merupakan lokasi Menteri Pekerjaan Umum dan Perumahan Rakyat (PUPR), Basuki Hadimuljono menggunakan hak suaranya.",
        isoDate: "2024-02-14T14:33:57.000Z",
        image: "https://asset-2.tstatic.net/jakarta/foto/bank/images/Pasangan-calon-Presiden-Capres-Anies-Baswedan-Muhaimin-Iskanda.jpg"))
}
