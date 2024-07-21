//
//  AskReviewLearn.swift
//  Instafilter
//
//  Created by Okan Orkun on 21.07.2024.
//

import SwiftUI
import StoreKit

struct AskReviewLearn: View {
    @Environment(\.requestReview) var requestView
    
    var body: some View {
        Button("Leave a review") {
            requestView()
        }
    }
}

#Preview {
    AskReviewLearn()
}
