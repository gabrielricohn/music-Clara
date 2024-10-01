//
//  HomeViewModel.swift
//  MusicAppClara
//
//  Created by Gabriel Rico on 28/9/24.
//

import Foundation
import Combine

@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var searchText = ""
    @Published var artistList: [Artist] = .init()
    @Published var errorMessage: String?
    @Published var isErrorFromNetwork: Bool = false
    
    // MARK: - Properties
    let musicService: MusicServiceType
    private let appConfigManager: AppConfigurationManagerType
    
    private var cancellables: Set<AnyCancellable> = .init()
    
    // MARK: - Initializer
    init(musicService: MusicServiceType = MusicService(),
         appConfigManager: AppConfigurationManagerType = AppConfigurationManager()) {
        self.musicService = musicService
        self.appConfigManager = appConfigManager
    }
    
    func getMusic() async {
        musicService.getMusic(searchTerm: searchText)
            .receive(on: DispatchQueue.main)
            .sink { response in
                guard case let .failure(error) = response else { return }
                self.errorMessage = error.localizedDescription
                self.isErrorFromNetwork.toggle()
                print("There was an error: \(error)")
            } receiveValue: { musicList in
                self.artistList = []
                for music in musicList.results {
                    if music.type == "artist" {
                        self.artistList.append(music)
                    }
                }
            }
            .store(in: &cancellables)
    }
}
