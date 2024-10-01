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
    @Published var errorMessage: String?
    @Published var isErrorFromNetwork: Bool = false
    @Published var isLoading: Bool = false
    
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
                self?.isLoading = false
                guard case let .failure(error) = response else { return }
                self?.errorMessage = error.localizedDescription
                self?.isErrorFromNetwork.toggle()
                print("There was an error: \(error)")
            } receiveValue: { artistDetails in
                self.isLoading = false
                self.artistDetails = artistDetails
            }
            .store(in: &cancellables)
    }
}
