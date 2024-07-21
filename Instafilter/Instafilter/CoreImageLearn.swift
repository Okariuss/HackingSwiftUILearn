//
//  CoreImageLearn.swift
//  Instafilter
//
//  Created by Okan Orkun on 21.07.2024.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct CoreImageLearn: View {
    @State private var image: Image?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
        let inputImage = UIImage(resource: .example)
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
        let currentFilter = CIFilter.crystallize()
        
        currentFilter.inputImage = beginImage
        currentFilter.radius = 200
        
        guard let outputImage = currentFilter.outputImage else { return }
        
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        
        let uiImage = UIImage(cgImage: cgImage)
        
        image = Image(uiImage: uiImage)
    }
}

#Preview {
    CoreImageLearn()
}
