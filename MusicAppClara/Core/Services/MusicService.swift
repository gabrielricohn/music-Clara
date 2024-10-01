//
//  MusicService.swift
//  MusicAppClara
//
//  Created by Gabriel Rico on 28/9/24.
//

import Foundation
import Combine

// MARK: - Movies Service Type
protocol MusicServiceType {
    func getMusic(searchTerm: String) -> AnyPublisher<MusicListResponse, Error>
    func getArtistDetails(artistId: String) -> AnyPublisher<ArtistDetailsResponse, Error>
    func getArtistAlbums(artistId: String) -> AnyPublisher<ArtistAlbumsResponse, Error>
    func getAlbumDetails(albumId: String, albumType: String) -> AnyPublisher<AlbumDetailsResponse, Error>
}

// MARK: - Movies Service
struct MusicService: MusicServiceType {
    // MARK: - Properties
    private let requester: NetworkingRequesterType
    
    // MARK: - Initializer
    init(requester: NetworkingRequesterType = NetworkingRequester()) {
        self.requester = requester
    }
    
    // MARK: - Functionality
    func getMusic(searchTerm: String) -> AnyPublisher<MusicListResponse, Error> {
        requester.execute(request: MusicTarget.getMusicList(searchTerm: searchTerm))
    }
    
    func getArtistDetails(artistId: String) -> AnyPublisher<ArtistDetailsResponse, Error> {
        requester.execute(request: MusicTarget.getArtistDetails(artistID: artistId))
    }
    
    func getArtistAlbums(artistId: String) -> AnyPublisher<ArtistAlbumsResponse, Error> {
        requester.execute(request: MusicTarget.getArtistAlbums(artistID: artistId))
    }
    
    func getAlbumDetails(albumId: String, albumType: String) -> AnyPublisher<AlbumDetailsResponse, Error> {
        var fixedAlbumType: String = ""
        if albumType == "release" {
            fixedAlbumType = "releases"
        } else if albumType == "master" {
            fixedAlbumType = "masters"
        } else {
            fixedAlbumType = albumType
        }
        
        return requester.execute(request: MusicTarget.getAlbumDetails(albumID: albumId, albumType: fixedAlbumType))
    }
}
