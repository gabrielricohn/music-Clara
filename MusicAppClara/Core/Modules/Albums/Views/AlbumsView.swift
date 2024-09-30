//
//  AlbumsView.swift
//  MusicAppClara
//
//  Created by Gabriel Rico on 29/9/24.
//

import SwiftUI

struct AlbumsView: View {
    @ObservedObject var viewModel: AlbumsViewModel
        
    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.albums, id: \.self) { album in
                    SearchItemView(imagePath: "", title: album.title, type: "\(album.year ?? 2024)")
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Text("Releases")
                                .font(.title)
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Menu {
                            Section("Filter By:") {
                                Menu {
                                    Button {
                                        viewModel.filterByAlphabet(isAscending: true)
                                    } label: {
                                        Text("Ascending")
                                    }
                                    Button {
                                        viewModel.filterByAlphabet(isAscending: false)
                                    } label: {
                                        Text("Descending")
                                    }
                                } label: {
                                    Text("Alphabetical")
                                }
                                
                                Menu {
                                    Button {
                                        viewModel.filterByYear(isAscending: true)
                                    } label: {
                                        Text("Ascending")
                                    }
                                    Button {
                                        viewModel.filterByYear(isAscending: false)
                                    } label: {
                                        Text("Descending")
                                    }
                                } label: {
                                    Text("Year")
                                }
                            }
                        } label: {
                            Image(systemName: "ellipsis.circle")
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
        .onAppear() {
            Task {
                await viewModel.fetchAlbums()
            }
        }
    }
}

#Preview {
    AlbumsView(viewModel: AlbumsViewModel(artistID: ""))
}
