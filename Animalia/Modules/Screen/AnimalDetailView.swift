//
//  AnimalDetailView.swift
//  Animalia
//
//  Created by User50 on 29/04/24.
//

import SwiftUI

struct AnimalDetailView: View {
    let animal: AnimalModel
    var body: some View {
        ScrollView(showsIndicators: false){
            // HERO IMAGE
            Image(animal.image)
                .resizable()
                .scaledToFit()
            // TITLE
            Text(animal.name.uppercased())
                .font(.largeTitle)
                .fontWeight(.heavy)
//                .underline(color:.accent)
                .background(
                    Color.accent
                        .frame(height: 8)
                        .offset(y:24)
                )
                
            Text(animal.headline)
                .font(.headline)
                .padding()
                .foregroundStyle(.accent)
            
            // GALLERY
            Group {
                HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                InsetGalleryView(animal: animal)
            }
            .padding(.horizontal)
            
            // FACT
            Group {
                HeadingView(headingImage: "questionmark.circle", headingText: "Did you know ??")
                    .padding(.vertical,8)
                    
                InsetFactView(animal: animal)
            }
            
            // DESCRIPTION
            Group {
                HeadingView(headingImage: "image.circle", headingText: "All about \(animal.name)")
                
                Text("\(animal.description)")
                    .padding()
            }
            
            // MAP
            Group {
                HeadingView(headingImage: "map", headingText: "National Parks")
                InsetMapView()
                
            }
            .padding(.horizontal)
            
            
            
        }
        .navigationTitle("Learn about \(animal.name)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    return NavigationStack{
        AnimalDetailView(animal: animals[2])
    }
    
}
