//
//  AlbumDetailsViewModel.swift
//  MusicAppClara
//
//  Created by Gabriel Rico on 30/9/24.
//

import Foundation
import Combine

class AlbumDetailsViewModel: ObservableObject {
    
    let albumID: String
    let albumType: String
    
    @Published var albumDetails: AlbumDetailsResponse?
    @Published var errorMessage: String?
    @Published var isErrorFromNetwork: Bool = false
    
    // MARK: - Properties
    let musicService: MusicServiceType
    private let appConfigManager: AppConfigurationManagerType
    
    private var cancellables: Set<AnyCancellable> = .init()
    
    // MARK: - Initializer
    init(albumID: String,
         albumType: String,
         musicService: MusicServiceType = MusicService(),
         appConfigManager: AppConfigurationManagerType = AppConfigurationManager()) {
        self.albumID = albumID
        self.albumType = albumType
        self.musicService = musicService
        self.appConfigManager = appConfigManager
    }
    
    func getAlbumDetails() async {
        musicService.getAlbumDetails(albumId: albumID, albumType: albumType)
            .receive(on: DispatchQueue.main)
            .sink { response in
                guard case let .failure(error) = response else { return }
                self.errorMessage = error.localizedDescription
                self.isErrorFromNetwork.toggle()
                print("There was an error: \(error)")
            } receiveValue: { albumDetails in
                self.albumDetails = albumDetails
            }
            .store(in: &cancellables)
    }
}
