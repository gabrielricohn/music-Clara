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
    case getMovieCredits(movieID: Int)
    case getSimilarMovie(movieID: Int)
    case getMovieProviders(movieID: Int)
    case getMovieTrailer(movieID: Int)
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
        case .getMovieCredits(let movieID):
            return "movie/\(movieID)/credits"
        case .getSimilarMovie(let movieID):
            return "movie/\(movieID)/similar"
        case .getMovieProviders(let movieID):
            return "movie/\(movieID)/watch/providers"
        case .getMovieTrailer(movieID: let movieID):
            return "movie/\(movieID)/videos"
        }
    }
    
    var requestMethod: Moya.Method {
        switch self {
        case .getMusicList, .getArtistDetails, .getArtistAlbums,
                .getMovieCredits, .getSimilarMovie,
                .getMovieProviders, .getMovieTrailer:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getMusicList(let artist):
            let parameters = ["q": artist,
                              "per_page": "30"]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        case .getArtistDetails, .getArtistAlbums, .getMovieCredits,
                .getSimilarMovie, .getMovieProviders, .getMovieTrailer:
            return .requestPlain
        }
    }
}
