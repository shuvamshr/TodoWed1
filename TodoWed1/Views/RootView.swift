//
//  RootView.swift
//  TodoWed1
//
//  Created by Shuvam Shrestha on 1/4/2026.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            Tab("Todo", systemImage: "house.fill") {
                TodoView()
            }
            Tab("Settings", systemImage: "gearshape.fill") {
                SettingsView()
            }
        }
    }
}

#Preview {
    RootView()
}
