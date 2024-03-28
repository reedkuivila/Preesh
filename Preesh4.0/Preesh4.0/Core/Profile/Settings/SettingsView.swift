//
//  SettingsView.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/28/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var enableNotifications = true
    @State private var useCellularData = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General")) {
                    Toggle("Enable Notifications", isOn: $enableNotifications)
                    Toggle("Use Cellular Data", isOn: $useCellularData)
                }
                
                Section(header: Text("Account")) {
                    Button("Change Password") {
                        // Implement action
                    }
                    Button("Privacy Settings") {
                        // Implement action
                    }
                }
                
                Section {
                    Button("Logout", role: .destructive) {
                        AuthService.shared.signOut()
                    }
                }
            }
            .navigationBarTitle("Settings", displayMode: .large)
        }
    }
}

#Preview {
    SettingsView()
}
