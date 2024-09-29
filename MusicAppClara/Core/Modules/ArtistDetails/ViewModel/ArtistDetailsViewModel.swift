//
//  ArtistDetailsViewModel.swift
//  MusicAppClara
//
//  Created by Gabriel Rico on 29/9/24.
//

import Foundation
import Combine

@MainActor
class ArtistDetailsViewModel: ObservableObject {
    
    let artistId: Int
    
    @Published var searchText = ""
    @Published var artistDetails: ArtistDetailsResponse?
    
    // MARK: - Properties
    let musicService: MusicServiceType
    private let appConfigManager: AppConfigurationManagerType
    
    private var cancellables: Set<AnyCancellable> = .init()
    
    // MARK: - Initializer
    init(artistId: Int,
         musicService: MusicServiceType = MusicService(),
         appConfigManager: AppConfigurationManagerType = AppConfigurationManager()) {
        self.artistId = artistId
        self.musicService = musicService
        self.appConfigManager = appConfigManager
        bindData()
    }
    
    func bindData() {
        getArtistDetails()
    }
    
    func getArtistDetails() {
        musicService.getArtistDetails(artistId: "\(artistId)")
            .receive(on: DispatchQueue.main)
            .sink { [weak self] response in
                guard case let .failure(error) = response else { return }
                print("There was an error: \(error)")
            } receiveValue: { artistDetails in
                self.artistDetails = artistDetails
            }
            .store(in: &cancellables)
    }
}
