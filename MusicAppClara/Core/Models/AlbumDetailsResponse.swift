//
//  AlbumDetailsResponse.swift
//  MusicAppClara
//
//  Created by Gabriel Rico on 30/9/24.
//

import Foundation

struct AlbumDetailsResponse: Codable, Hashable {
    
    let artists: [AlbumArtist]
    let title: String
    let notes: String?
    let releasedFormatted: String?
    let thumb: String?
    let videos: [Video]?
    let tracklist: [Track]
    let images: [AlbumImage]?
    let labels: [Label]?
    let year: Int
    let genres: [String]?
    
    enum CodingKeys: String, CodingKey {
        case artists
        case title
        case notes
        case releasedFormatted = "released_formatted"
        case thumb
        case videos
        case tracklist
        case images
        case labels
        case year
        case genres
    }
}

struct Label: Codable, Hashable {
    
    let name: String
}

struct AlbumImage: Codable, Hashable {
    
    let type: String
    let uri: String
}

struct AlbumArtist: Codable, Hashable {
    
    let name: String
}

struct Video: Codable, Hashable {
    
    let uri: String
    let title: String
}

struct Track: Codable, Hashable {
    
    let position: String
    let title: String
    let duration: String
    let extraArtists: [ExtraArtist]?
}

struct ExtraArtist: Codable, Hashable {
    
    let name: String
    let role: String
}


