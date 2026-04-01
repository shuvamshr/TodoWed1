//
//  SettingsView.swift
//  TodoWed1
//
//  Created by Shuvam Shrestha on 1/4/2026.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            List {
                Text("Dark Mode")
            }
            .navigationBarTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SettingsView()
}
