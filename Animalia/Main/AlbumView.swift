//
//  AlbumView.swift
//  Animalia
//
//  Created by User50 on 30/04/24.
//

import SwiftUI
import PhotosUI

struct AlbumView: View {
    // @State private var selectedItems: PhotosPickerItem?
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var selectedImages: [UIImage] = []
    
    var body: some View {
        // MARK: - DISPLAY SELECTED IMAGES
        VStack {
            if selectedImages.isEmpty {
                ContentUnavailableView("no Photos", systemImage: "photo.on.rectangle", description: Text("To get started, select some photos below."))
                    .frame(height: 300)
            } else {
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(selectedImages, id:\.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 250)
                                .clipShape(RoundedRectangle(cornerRadius: 24))
                                .padding(.horizontal,20)
                                .containerRelativeFrame(.horizontal)
                        }
                    }
                }// ScrollView
                .frame(height: 300)
            }
            Spacer()
            
            // MARK: - PHOTO PICKER
            // matching adalah all files, or photo, or whatapp, screenshot
            PhotosPicker(selection: $selectedItems, maxSelectionCount: 5,selectionBehavior: .continuousAndOrdered,matching: .images) {
                Label("Select a photo", systemImage: "photo")
            }
            .photosPickerStyle(.inline)
//            .photosPickerDisabledCapabilities(.selectionActions)
            .frame(height: 500)
            .ignoresSafeArea()
            .onChange(of: selectedItems) { oldItems, newItems in
                
                print("Old items: \(oldItems.count)")
                print("New items: \(newItems.count)")
                selectedImages = []
                
                
                newItems.forEach { newItem in
                    
                    Task {
                        if let data = try? await newItem.loadTransferable(type: Data.self) {
                            if let image = UIImage(data: data) {
                                selectedImages.append(image)
                            }
                        }
                    }
                }
            }
        }// VSTACK
        
    }
    
    // Simple implementation
//    var body: some View {
//        PhotosPicker(selection: $selectedItems, matching: .images) {
//            Label("Select a photo", systemImage: "photo")
//        }
//    }
    
    
}

#Preview {
    AlbumView()
}
