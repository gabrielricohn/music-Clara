//
//  HomeViewModel.swift
//  MusicAppClara
//
//  Created by Gabriel Rico on 28/9/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    // MARK: - Properties
    let musicService: MusicServiceType
    private let appConfigManager: AppConfigurationManagerType
    
    @Published var searchText = ""
    @Published var artistList: [Artist] = .init()
    
    private var cancellables: Set<AnyCancellable> = .init()
    
    // MARK: - Initializer
    init(musicService: MusicServiceType = MusicService(),
         appConfigManager: AppConfigurationManagerType = AppConfigurationManager()) {
        self.musicService = musicService
        self.appConfigManager = appConfigManager
    }
    
    func getMusic() async {
//        pageCounter = page
        
//        if page == 1 {
//            movieList.removeAll()
//        }
        
        musicService
            .getMusic(searchTerm: searchText)
            .receive(on: DispatchQueue.main)
            .sink { response in
                guard case let .failure(error) = response else { return }
                print("There was an error: \(error)")
            } receiveValue: { musicList in
                self.artistList = musicList.results
            }
            .store(in: &cancellables)
    }
}
