//
//  AlbumDetailsView.swift
//  MusicAppClara
//
//  Created by Gabriel Rico on 30/9/24.
//

import SwiftUI

struct AlbumDetailsView: View {
    @ObservedObject var viewModel: AlbumDetailsViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading) {
                    MusicCard(image: viewModel.albumDetails?.images?.first?.uri ?? "", isArtistDetailsView: true)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2, alignment: .leading)
                        .mask(LinearGradient(gradient: Gradient(stops: [
                            .init(color: .black, location: 0),
                            .init(color: .clear, location: 1),
                            .init(color: .black, location: 1),
                            .init(color: .clear, location: 1)
                        ]), startPoint: .top, endPoint: .bottom))
                    Group {
                        VStack(alignment: .center) {
                            Text(viewModel.albumDetails?.title ?? "")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            Text(viewModel.albumDetails?.artists.first?.name ?? "")
                                .font(.title2)
                                .foregroundStyle(.white)
                            HStack {
                                Text(viewModel.albumDetails?.genres?.first ?? "")
                                Text("-")
                                Text(verbatim: "\(viewModel.albumDetails?.year ?? 2024)")
                            }
                            .foregroundStyle(.gray)
                            .font(.caption)
                        }.position(x: UIScreen.main.bounds.width/2)
                        ForEach(viewModel.albumDetails?.tracklist ?? [], id: \.self) { track in
                            AlbumTrackView(artist: viewModel.albumDetails?.artists.first?.name ?? "", track: track)
                        }
                        VStack(alignment: .leading) {
                            Text(viewModel.albumDetails?.releasedFormatted ?? "")
                            Text(viewModel.albumDetails?.labels?.first?.name ?? "")
                        }
                        .padding(.top, 4)
                        .padding([.leading, .trailing], 20)
                        .foregroundStyle(.gray)
                    }
                    .offset(y: -70)
                }
            }
            if viewModel.isLoading {
                ActivityIndicator()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.orange)
            }
        }
        .ignoresSafeArea(.container, edges: .top)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left.circle.fill")
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(.white, .gray)
                    }
                }
            }
        }
        .alert(isPresented: $viewModel.isErrorFromNetwork) {
            Alert(title: Text("Network Error"),
                  message: Text(viewModel.errorMessage ?? ""),
                  dismissButton: .default(Text("OK")))
        }
        .onAppear {
            Task {
                viewModel.isLoading = true
                await viewModel.getAlbumDetails()
            }
        }
    }
}

#Preview {
    AlbumDetailsView(viewModel: AlbumDetailsViewModel(albumID: "31829408", albumType: "releases"))
}
