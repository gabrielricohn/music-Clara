//
//  AlbumsViewModelTests.swift
//  MusicAppClaraTests
//
//  Created by Gabriel Rico on 30/9/24.
//

import Foundation
import XCTest
@testable import MusicAppClara

@MainActor
class AlbumsViewModelTests: XCTestCase {

    private var musicServiceMock: MockMusicService!
    
    private var viewModel: AlbumsViewModel!
    
    override func setUpWithError() throws {
        musicServiceMock = MockMusicService()
        viewModel = AlbumsViewModel(artistID: "31212",
                                    musicService: musicServiceMock)
    }

    override func tearDownWithError() throws {
        musicServiceMock = nil
    }

    func testFetchAlbums() async throws {
        
        try await Task<Never, Never>.sleep(nanoseconds: 1000000)
        
        await viewModel.fetchAlbums()
        
        XCTAssertNotNil(viewModel.albums)
    }
}
