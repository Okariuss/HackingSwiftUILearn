//
//  WriteDataToTheDocument.swift
//  BucketList
//
//  Created by Okan Orkun on 21.07.2024.
//

import SwiftUI

struct WriteDataToTheDocument: View {
    var body: some View {
        Button("Read and Writee") {
            let data = Data("Test Message".utf8)
            let url = URL.documentsDirectory.appending(path: "message.txt")
            
            do {
                try data.write(to: url, options: [.atomic, .completeFileProtection])
                let input = try String(contentsOf: url)
                print(input)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    WriteDataToTheDocument()
}
