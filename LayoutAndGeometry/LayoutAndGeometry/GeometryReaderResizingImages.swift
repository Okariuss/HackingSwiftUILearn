//
//  GeometryReaderResizingImages.swift
//  LayoutAndGeometry
//
//  Created by Okan Orkun on 29.07.2024.
//

import SwiftUI

struct GeometryReaderResizingImages: View {
    var body: some View {
        Image(.example)
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 300)
        
        GeometryReader { proxy in
            Image(.example)
                .resizable()
                .scaledToFit()
                .frame(width: proxy.size.width * 0.8)
        }
        
        Image(.example)
            .resizable()
            .scaledToFit()
            .containerRelativeFrame(.horizontal) { size, axis in
                size * 0.8
            }
        
        GeometryReader { proxy in
            Image(.example)
                .resizable()
                .scaledToFit()
                .frame(width: proxy.size.width * 0.8)
                .frame(width: proxy.size.width, height: proxy.size.height)
        }
    }
}

#Preview {
    GeometryReaderResizingImages()
}
