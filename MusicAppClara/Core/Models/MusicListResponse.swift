//
//  MusicListResponse.swift
//  MusicAppClara
//
//  Created by Gabriel Rico on 28/9/24.
//

import Foundation

struct MusicListResponse: Codable {
//    let results: [Movie]
//    let dates: MovieDates?
    let page: Int
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
//        case results
//        case dates
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
