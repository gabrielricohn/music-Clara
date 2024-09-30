//
//  ArtistAlbumsResponse.swift
//  MusicAppClara
//
//  Created by Gabriel Rico on 29/9/24.
//

import Foundation

struct ArtistAlbumsResponse: Codable {
    
    let releases: [Album]
}

struct Album: Codable, Hashable {
    
    let id: Int
    let title: String
    let year: Int?
}
