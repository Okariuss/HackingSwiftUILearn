//
//  ShareLinkLearn.swift
//  Instafilter
//
//  Created by Okan Orkun on 21.07.2024.
//

import SwiftUI

struct ShareLinkLearn: View {
    var body: some View {
        ShareLink(
            item: URL(string: "https://www.hackingwithswift.com")!,
            subject: Text("Learn Swift here"),
            message: Text("Check out the 100 days of SwiftUI!")
        )
        
        ShareLink(
            item: URL(string: "https://www.hackingwithswift.com")!) {
            Label("Spread the word about Swift", systemImage: "swift")
        }
        
        let example = Image(.example)

        ShareLink(item: example, preview: SharePreview("Singapore Airport", image: example)) {
            Label("Click to share", systemImage: "airplane")
        }
    }
}

#Preview {
    ShareLinkLearn()
}
