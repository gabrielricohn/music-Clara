//
//  MusicTarget.swift
//  MusicAppClara
//
//  Created by Gabriel Rico on 28/9/24.
//

import Foundation
import Moya

// MARK: - Shows Target
enum MusicTarget {
    case getMusicList(searchTerm: String)
    case getArtistDetails(artistID: String)
    case getArtistAlbums(artistID: String)
    case getAlbumDetails(albumID: String, albumType: String)
}

// MARK: - Shows Target Implementation
extension MusicTarget: NetworkingTargetType {
    var requestPath: String {
        switch self {
        case .getMusicList(_):
            return "database/search"
        case .getArtistDetails(let artistID):
            return "artists/\(artistID)"
        case .getArtistAlbums(let artistID):
            return "artists/\(artistID)/releases"
        case .getAlbumDetails(let albumID, let albumType):
            return "\(albumType)/\(albumID)"
        }
    }
    
    var requestMethod: Moya.Method {
        switch self {
        case .getMusicList, .getArtistDetails, .getArtistAlbums, .getAlbumDetails:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getMusicList(let artist):
            let parameters = ["q": artist,
                              "per_page": "30"]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        case .getArtistDetails, .getArtistAlbums, .getAlbumDetails:
            return .requestPlain
        }
    }
}
