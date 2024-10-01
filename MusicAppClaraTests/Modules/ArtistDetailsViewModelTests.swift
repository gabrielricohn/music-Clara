//
//  ArtistDetailsViewModelTests.swift
//  MusicAppClaraTests
//
//  Created by Gabriel Rico on 30/9/24.
//

import Testing
import XCTest
@testable import MusicAppClara

@MainActor
class ArtistDetailsViewModelTests: XCTestCase {

    private var musicServiceMock: MockMusicService!
    
    private var viewModel: ArtistDetailsViewModel!
    
    override func setUpWithError() throws {
        musicServiceMock = MockMusicService()
        viewModel = ArtistDetailsViewModel(artistId: 31221,
                                           musicService: musicServiceMock)
    }

    override func tearDownWithError() throws {
        musicServiceMock = nil
    }

    func testGetMusic() async throws {
        
        try await Task<Never, Never>.sleep(nanoseconds: 1000000)
        
        viewModel.getArtistDetails()
        
        XCTAssertNotNil(viewModel.artistDetails)
    }
}
