//
//  AlbumsViewModel.swift
//  MusicAppClara
//
//  Created by Gabriel Rico on 29/9/24.
//

import Foundation
import Combine

class AlbumsViewModel: ObservableObject {
    
    let artistID: String
    @Published var albums: [Album] = []
    
    // MARK: - Properties
    let musicService: MusicServiceType
    private let appConfigManager: AppConfigurationManagerType
    
    private var cancellables: Set<AnyCancellable> = .init()
    
    // MARK: - Initializer
    init(artistID: String,
         musicService: MusicServiceType = MusicService(),
         appConfigManager: AppConfigurationManagerType = AppConfigurationManager()) {
        self.artistID = artistID
        self.musicService = musicService
        self.appConfigManager = appConfigManager
    }
    
    func fetchAlbums() async {
        musicService.getArtistAlbums(artistId: artistID)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] response in
                guard case let .failure(error) = response else { return }
                print("There was an error: \(error)")
            } receiveValue: { album in
                self.albums = album.releases
            }
            .store(in: &cancellables)
    }
    
    func filterByAlphabet(isAscending: Bool) {
        if isAscending {
            albums.sort(by: { $0.title.lowercased() < $1.title.lowercased()})
        } else {
            albums.sort(by: { $0.title.lowercased() > $1.title.lowercased()})
        }
    }
    
    func filterByYear(isAscending: Bool) {
        if isAscending {
            albums.sort(by: { $0.year ?? 2024 < $1.year ?? 2024 })
        } else {
            albums.sort(by: { $0.year ?? 2024 > $1.year ?? 2024 })
        }
    }
}
