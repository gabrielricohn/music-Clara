//
//  SearchItemView.swift
//  MusicAppClara
//
//  Created by Gabriel Rico on 29/9/24.
//

import SwiftUI

struct SearchItemView: View {
    let imagePath: String
    let title: String
    let type: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                MusicCard(image: imagePath)
                    .frame(width: 75, height: 75, alignment: .leading)
                    .padding(.trailing, 12)
                VStack(alignment: .leading) {
                    Text(title)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    HStack {
                        Image(systemName: "music.mic")
                            .foregroundColor(.gray)
                            .frame(width: 13, height: 13)
                        Text(type.capitalized)
                            .foregroundColor(.gray)
                            .font(.system(size: 14))
                    }
                }
                Spacer()
                HStack {
                    Image(systemName: "chevron.forward")
                        .foregroundColor(.gray)
                }
            }
            .padding(.top, 4)
            .padding([.leading, .trailing], 16)
            Divider()
        }
    }
}

#Preview {
    SearchItemView(imagePath: "", title: "", type: "")
}
