//
//  BandMembersView.swift
//  MusicAppClara
//
//  Created by Gabriel Rico on 29/9/24.
//

import SwiftUI

struct BandMembersView: View {
    // MARK: - Properties
    let url: String
    let title: String

    // MARK: - Body
    var body: some View {
        VStack(alignment: .center) {
            CacheAsyncImage(url: (URL(string: "\(url)") ?? URL(string: "none"))!, content: { phase in
                
                switch phase {
                case .success(let image):
                    image.resizable()
                        .frame(width: 120, height: 120)
                        .aspectRatio(contentMode: .fill)
                case .failure(_):
                    Image("placeholder")
                        .resizable(resizingMode: .tile)
                case .empty:
                    Image("placeholder")
                        .resizable(resizingMode: .tile)
                @unknown default:
                    Image("placeholder")
                        .resizable(resizingMode: .tile)
                }
            })
            .clipShape(
                Circle()
            )
            .overlay(
                Circle()
                    .foregroundStyle(
                        .linearGradient(colors: [.black.opacity(0.5),
                                                 .black.opacity(0.1)],
                                        startPoint: .bottomTrailing,
                                        endPoint: .topTrailing)
                    )
            )
            Text("\(title)")
                .foregroundColor(.white)
                .lineLimit(2)
                .bold()
                .font(.system(size: 12))
        }
    }
}

#Preview {
    BandMembersView(url: "https://i.discogs.com/Pv9xfftInLc4yoZm-drPVAYi0QMkxfG1bVHAbJl_lF4/rs:fit/g:sm/q:40/h:611/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9BLTIwMzAx/Ny0xNTEyMjA5MzAy/LTEyNTcuanBlZw.jpeg", title: "Dave Grohl")
}
