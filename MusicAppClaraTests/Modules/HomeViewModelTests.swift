//
//  HomeViewModelTests.swift
//  MusicAppClaraTests
//
//  Created by Gabriel Rico on 30/9/24.
//

import Testing
@testable import MusicAppClara
import XCTest

@MainActor
class HomeViewModelTests: XCTestCase {
    private var musicServiceMock: MockMusicService!
    
    private var viewModel: HomeViewModel!
    
    override func setUpWithError() throws {
        musicServiceMock = MockMusicService()
        viewModel = HomeViewModel(musicService: musicServiceMock)
    }

    override func tearDownWithError() throws {
        musicServiceMock = nil
    }

    func testGetMusic() async {
        
        await viewModel.getMusic()
        
        XCTAssertNotNil(viewModel.artistList)
    }
}
