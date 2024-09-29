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
        requester.execute(request: MusicTarget.getMusicList(searchTerm: "nirvana"))
    }
}
