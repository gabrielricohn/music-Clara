//
//  MockMusicService.swift
//  MusicAppClaraTests
//
//  Created by Gabriel Rico on 30/9/24.
//

import Testing
import Combine
@testable import MusicAppClara

class MockMusicService: MusicServiceType {
    
    var didGetMusic = false
    var musicList: CurrentValueSubject<MusicListResponse, any Error> = .init(.init(results: []))
    func getMusic(searchTerm: String) -> AnyPublisher<MusicListResponse, any Error> {
        didGetMusic = true
        return musicList.eraseToAnyPublisher()
    }
    
    var didGetArtistDetails = false
    var artistDetails = CurrentValueSubject<ArtistDetailsResponse, any Error>(.init(name: "", images: [], profile: "", members: []))
    func getArtistDetails(artistId: String) -> AnyPublisher<ArtistDetailsResponse, any Error> {
        didGetArtistDetails = true
        return artistDetails.eraseToAnyPublisher()
    }
    
    var didGetArtistAlbums = false
    var artistAlbums = CurrentValueSubject<ArtistAlbumsResponse, any Error>(.init(releases: []))
    func getArtistAlbums(artistId: String) -> AnyPublisher<ArtistAlbumsResponse, any Error> {
        didGetArtistAlbums = true
        return artistAlbums.eraseToAnyPublisher()
    }
    
    var didGetAlbumDetails = false
    var albumDetails = CurrentValueSubject<AlbumDetailsResponse, any Error>(.init(artists: [], title: "", notes: "", releasedFormatted: "", thumb: "", videos: [], tracklist: [], images: [], labels: [], year: 0, genres: []))
    func getAlbumDetails(albumId: String, albumType: String) -> AnyPublisher<AlbumDetailsResponse, any Error> {
        didGetAlbumDetails = true
        return albumDetails.eraseToAnyPublisher()
    }
}
