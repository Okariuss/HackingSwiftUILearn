//
//  GroupsAsTransparentLayout.swift
//  SnowSeeker
//
//  Created by Okan Orkun on 30.07.2024.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Okan")
            Text("Country: Turkiye")
            Text("Pets: Lancy and Cory")
        }
        .font(.title)
    }
}

struct GroupsAsTransparentLayout: View {
    
    @State private var layoutVertically = false
    
    var body: some View {
        
        Button {
            layoutVertically.toggle()
        } label: {
            if layoutVertically  {
                VStack {
                    UserView()
                }
            }
            else {
                HStack {
                    UserView()
                }
            }
        }
    }
}

struct HorizontalClass: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        if horizontalSizeClass == .compact {
            VStack(content: UserView.init)
        } else {
            HStack(content: UserView.init)
        }
    }
}

struct ViewFits: View {
    var body: some View {
        ViewThatFits {
            Rectangle()
                .frame(width: 500, height: 300)
            
            Circle()
                .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    ViewFits()
}
