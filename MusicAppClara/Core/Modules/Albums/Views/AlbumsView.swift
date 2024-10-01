//
//  AlbumsView.swift
//  MusicAppClara
//
//  Created by Gabriel Rico on 29/9/24.
//

import SwiftUI

struct AlbumsView: View {
    @ObservedObject var viewModel: AlbumsViewModel
    @Environment(\.dismiss) var dismiss
        
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.albums, id: \.self) { album in
                    NavigationLink {
                        AlbumDetailsView(viewModel: AlbumDetailsViewModel(albumID: "\(album.id)", albumType: album.type ?? ""))
                    } label: {
                        SearchItemView(imagePath: "", title: album.title, type: "\(album.year ?? 2024)")
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left.circle")
                            .foregroundStyle(.white)
                    }
                }
            }
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
        .preferredColorScheme(.dark)
        .alert(isPresented: $viewModel.isErrorFromNetwork) {
            Alert(title: Text("Network Error"),
                  message: Text(viewModel.errorMessage ?? ""),
                  dismissButton: .default(Text("OK")))
        }
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
