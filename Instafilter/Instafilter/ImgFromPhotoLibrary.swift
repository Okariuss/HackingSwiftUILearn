//
//  ImgFromPhotoLibrary.swift
//  Instafilter
//
//  Created by Okan Orkun on 21.07.2024.
//

import PhotosUI
import SwiftUI

struct ImgFromPhotoLibrary: View {
    @State private var pickerItems = [PhotosPickerItem]()
    @State private var pickerItem: PhotosPickerItem?
    
    @State private var selectedImages = [Image]()
    @State private var selectedImage: Image?
    
    var body: some View {
        VStack {
            selectedImage?
                .resizable()
                .scaledToFit()
            
            PhotosPicker("Select a picture", selection: $pickerItem, matching: .images)
            
            ScrollView {
                ForEach(0..<selectedImages.count, id: \.self) { i in
                    selectedImages[i]
                        .resizable()
                        .scaledToFit()
                }
            }
            
//            PhotosPicker(selection: $pickerItems, maxSelectionCount: 3, matching: .images) {
//                Label("Select a picture", systemImage: "photo")
//            }
            PhotosPicker(selection: $pickerItems, maxSelectionCount: 3, matching: .any(of: [.images, .not(.screenshots)])) {
                Label("Select a picture", systemImage: "photo")
            }
        }
        .onChange(of: pickerItem) {
            Task {
                selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
                
                selectedImages.removeAll()
                for item in pickerItems {
                    if let loadedImage = try await item.loadTransferable(type: Image.self) {
                        selectedImages.append(loadedImage)
                    }
                }
            }
        }
    }
}

#Preview {
    ImgFromPhotoLibrary()
}
