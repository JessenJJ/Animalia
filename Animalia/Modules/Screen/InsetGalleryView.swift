//
//  InsetGalleryView.swift
//  Animalia
//
//  Created by User50 on 29/04/24.
//

import SwiftUI

struct InsetGalleryView: View {
    let animal: AnimalModel
    var body: some View {
        ScrollView(.horizontal ,showsIndicators: false) {
            HStack (spacing: 16){
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }
        }
    }
}

#Preview {
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    return InsetGalleryView(animal: animals[2])
}
