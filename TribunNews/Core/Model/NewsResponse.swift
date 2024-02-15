//
//  NewsResponse.swift
//  TribunNews
//
//  Created by Andira Yunita on 14/02/24.
//

import Foundation

struct NewsResponse: Decodable {
    var message: String
    var total: Int
    var data: [News]
}

struct News: Decodable, Identifiable {
    var id: String { link }
    var title: String
    var link: String
    var contentSnippet: String
    var isoDate: String
    var image: String
}
