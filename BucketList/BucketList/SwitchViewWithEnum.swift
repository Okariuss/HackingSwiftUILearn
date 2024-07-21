//
//  SwitchViewWithEnum.swift
//  BucketList
//
//  Created by Okan Orkun on 21.07.2024.
//

import SwiftUI

struct SwitchViewWithEnum: View {
    @State private var loadingState = LoadingState.loading
    
    var body: some View {
        switch loadingState {
        case .loading:
            LoadingView()
        case .success:
            SuccessView()
        case .failed:
            FailedView()
        }
    }
}

enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}

#Preview {
    SwitchViewWithEnum()
}
