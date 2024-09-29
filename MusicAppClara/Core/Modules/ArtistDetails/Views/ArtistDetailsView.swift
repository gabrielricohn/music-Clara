//
//  ArtistDetailsView.swift
//  MusicAppClara
//
//  Created by Gabriel Rico on 29/9/24.
//

import SwiftUI

struct ArtistDetailsView: View {
    @ObservedObject var viewModel: ArtistDetailsViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                MusicCard(image: viewModel.artistDetails?.images.first?.uri ?? "", isArtistDetailsView: true)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2.5, alignment: .leading)
                    .edgesIgnoringSafeArea(.top)
                
                Group {
                    Text(viewModel.artistDetails?.name ?? "")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .bold()
                        .padding([.top, .leading, .bottom], 12)
                    if viewModel.artistDetails?.members?.isEmpty == false {
                        membersView
                    }
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Text("Albums")
                                .foregroundStyle(.white)
                                .font(.title)
                            Image(systemName: "chevron.forward")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.bottom, 12)
                    
                    aboutView
                }
                .padding([.leading, .trailing], 8)
                .offset(y: -75)
            }
        }
        .preferredColorScheme(.dark)
    }
    
    @ViewBuilder
    private var membersView: some View {
        let gridItemLayout = [GridItem(.flexible(), spacing: 10)]
        
        VStack(alignment: .leading) {
            Text("Members")
                .foregroundStyle(.white)
                .font(.title)
            ScrollView(.horizontal) {
                LazyHGrid(rows: gridItemLayout) {
                    ForEach(viewModel.artistDetails?.members ?? [], id: \.self) { member in
                        BandMembersView(url: member.thumbnail, title: member.name)
                            .id(member.name)
                    }
                }
            }
            .frame(height: 200)
        }
        .padding(.top, 8)
    }
    
    @ViewBuilder
    private var aboutView: some View {
        VStack(alignment: .leading) {
            Text("About")
                .foregroundStyle(.white)
                .font(.title)
            Text(viewModel.artistDetails?.profile ?? "")
        }
    }
}

#Preview {
    ArtistDetailsView(viewModel: ArtistDetailsViewModel(artistId: 5319746))
}
