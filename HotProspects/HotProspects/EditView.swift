//
//  EditView.swift
//  HotProspects
//
//  Created by Okan Orkun on 25.07.2024.
//

import SwiftUI

struct EditView: View {
    
    @Binding var prospect: Prospect
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section(header: Text("Contact Info")) {
                TextField("Name", text: $prospect.name)
                TextField("Email", text: $prospect.emailAddress)
            }
        }
        .navigationTitle("Edit Prospect")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    EditView(prospect: .constant(Prospect(name: "Okan", emailAddress: "okan@mail.com", isConnected: true)))
}
