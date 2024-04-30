//
//  VideoListItemView.swift
//  Animalia
//
//  Created by User50 on 30/04/24.
//

import SwiftUI

struct VideoListItemView: View {
    let model:VideoModel
    var body: some View {
        HStack (spacing:12) {
            ZStack {
                Image(model.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }
            VStack (alignment: .leading, spacing: 12) {
                Text(model.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)
                Text(model.headline)
                    .font(.footnote)
                    .lineLimit(2)
            }
        }
    }
}

#Preview {
    let model:[VideoModel] = Bundle.main.decode("videos.json")
    return VideoListItemView(model: model[1])
}
