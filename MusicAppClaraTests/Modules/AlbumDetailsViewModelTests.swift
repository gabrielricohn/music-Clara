//
//  AlbumDetailsViewModelTests.swift
//  MusicAppClaraTests
//
//  Created by Gabriel Rico on 30/9/24.
//

import Foundation
import XCTest
@testable import MusicAppClara

@MainActor
class AlbumDetailsViewModelTests: XCTestCase {

    private var musicServiceMock: MockMusicService!
    
    private var viewModel: AlbumDetailsViewModel!
    
    override func setUpWithError() throws {
        musicServiceMock = MockMusicService()
        viewModel = AlbumDetailsViewModel(albumID: "212332",
                                          albumType: "releases",
                                          musicService: musicServiceMock)
    }

    override func tearDownWithError() throws {
        musicServiceMock = nil
    }

    func testGetAlbumDetails() async throws {
        
        try await Task<Never, Never>.sleep(nanoseconds: 1000000)
        
        await viewModel.getAlbumDetails()
        
        XCTAssertNotNil(viewModel.albumDetails)
    }
}
