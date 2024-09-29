//
//  MusicCard.swift
//  MusicAppClara
//
//  Created by Gabriel Rico on 29/9/24.
//

import SwiftUI

struct MusicCard: View {
    
    // MARK: - Properties
    let image: String

    // MARK: - Body
    var body: some View {
        ZStack {
            VStack {
                imageContainer
            }
        }.cornerRadius(15)
    }

    // MARK: - Views
    @ViewBuilder
    var imageContainer: some View {
        ZStack {
            CacheAsyncImage(url: (URL(string: "\(image)") ?? URL(string: "none"))!, content: { phase in
                
                switch phase {
                case .success(let image):
                    image.resizable()
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
        }
    }
}

#Preview {
    MusicCard(image: "")
}
