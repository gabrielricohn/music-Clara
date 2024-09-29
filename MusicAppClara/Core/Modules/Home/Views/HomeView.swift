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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                Task {
                    await viewModel.getMusic(with: "Nirvana")
                }
            }
    }
}

#Preview {
    HomeView()
}
