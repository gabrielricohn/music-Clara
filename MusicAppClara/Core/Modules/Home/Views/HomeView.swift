//
//  HomeView.swift
//  MusicAppClara
//
//  Created by Gabriel Rico on 28/9/24.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Property Wrappers
    @StateObject private var viewModel: HomeViewModel = .init()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if viewModel.artistList.count > 0 {
                    
                    ForEach(viewModel.artistList, id: \.self) { artist in
                        NavigationLink(value: artist) {
                            SearchItemView(imagePath: artist.thumb, title: artist.title, type: artist.type)
                        }
                    }
                    
                    .navigationDestination(for: Artist.self, destination: { artist in
                        ArtistDetailsView(viewModel: ArtistDetailsViewModel(artistId: artist.id))
                    })
                } else {
                    Text("Search for an artist to get started")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Text("Search")
                            .font(.title)
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        .onChange(of: viewModel.searchText) {
            if viewModel.searchText.count > 2 {
                Task(priority: .userInitiated) {
                    await viewModel.getMusic()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
