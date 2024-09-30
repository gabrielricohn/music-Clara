//
//  AlbumTrackView.swift
//  MusicAppClara
//
//  Created by Gabriel Rico on 30/9/24.
//

import SwiftUI

struct AlbumTrackView: View {
    let artist: String
    let track: Track
    
    var body: some View {
        VStack {
            HStack {
                Text(track.position)
                    .padding(.trailing, 20)
                    .foregroundStyle(.gray)
                VStack(alignment: .leading) {
                    Text(track.title)
                    if track.extraArtists?.count ?? 0 > 0 {
                        Text("\(artist) & \(track.extraArtists?.first?.name ?? "")")
                            .foregroundStyle(.gray)
                            .font(.caption)
                    }
                }
                Spacer()
                Text(track.duration)
            }
            .padding([.leading, .trailing], 20)
            Divider()
        }
    }
}

#Preview {
    AlbumTrackView(artist: "Feid", track: Track(position: "1", title: "LA VUELTA", duration: "4:20", extraArtists: [ExtraArtist(name: "Mañas Ru-Fino", role: "Featuring")]))
}
