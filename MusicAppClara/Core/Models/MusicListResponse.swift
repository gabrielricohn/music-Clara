//
//  MusicListResponse.swift
//  MusicAppClara
//
//  Created by Gabriel Rico on 28/9/24.
//

import Foundation

struct MusicListResponse: Codable {
    let results: [Artist]
//    let page: Int
//    let pages: Int
//    let items: Int
    
//    enum CodingKeys: String, CodingKey {
//        case results
//        case page
//        case pages
//        case items = "items"
//    }
}

struct Artist: Codable, Hashable {
    let id: Int
    let title: String
    let type: String
//    let genre: [ArtistGenre]
    let coverImage: String
    let thumb: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case type
//        case genre
        case coverImage = "cover_image"
        case thumb
    }
}

struct ArtistGenre: Codable {
    let genre: String
}
