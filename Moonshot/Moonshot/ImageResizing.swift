//
//  ImageResizing.swift
//  Moonshot
//
//  Created by Okan Orkun on 11.07.2024.
//

import SwiftUI

struct ImageResizing: View {
    var body: some View {
        
        Image(.example)
            .resizable()
            .scaledToFit()
            .containerRelativeFrame(.horizontal) { size, axis in
                size * 0.8
            }
        
//        Image(.example)
//            .resizable()
//            .scaledToFit()
//            .frame(width: 300, height: 300)
    }
}

#Preview {
    ImageResizing()
}
