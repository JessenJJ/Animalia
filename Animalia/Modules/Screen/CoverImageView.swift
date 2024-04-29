//
//  Screen.swift
//  Animalia
//
//  Created by User50 on 29/04/24.
//

import SwiftUI

struct CoverImageView: View {
    let coverImages: [CoversImageModel] = Bundle.main.decode("covers.json")
    
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    CoverImageView()
}
