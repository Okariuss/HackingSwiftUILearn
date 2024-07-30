//
//  AlertAndSheetOptional.swift
//  SnowSeeker
//
//  Created by Okan Orkun on 30.07.2024.
//

import SwiftUI

struct UserLearn: Identifiable {
    var id = "Taylor Swift"
}

struct AlertAndSheetOptional: View {
    
    @State private var selectedUser: UserLearn? = nil
    @State private var isShowingUser = false
    
    var body: some View {
        Button("Tap Me") {
            isShowingUser = true
            selectedUser = UserLearn()
        }
//        .sheet(item: $selectedUser) { user in
//            Text(user.id)
//        }
        .alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
            Text(user.id)
                .presentationDetents([.medium, .large])
        }
    }
}

#Preview {
    AlertAndSheetOptional()
}
