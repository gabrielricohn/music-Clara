//
//  ArtistDetailsResponse.swift
//  MusicAppClara
//
//  Created by Gabriel Rico on 29/9/24.
//

import Foundation

struct ArtistDetailsResponse: Codable {
    let name: String
    let images: [ArtistImage]
    let profile: String
    let members: [BandMembers]?
}

struct ArtistImage: Codable {
    let type: String
    let uri: String
}

struct BandMembers: Codable, Hashable {
    let name: String
    let thumbnail: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case thumbnail = "thumbnail_url"
    }
}
