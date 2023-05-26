//
//  SettingsView.swift
//  Preesh
//
//  Created by reed kuivila on 5/26/23.
//

import SwiftUI


struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var enableNotifications: Bool = true
    @State private var privateProfile: Bool = false
    @State private var enableFaceID: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Developer Information")) {
                    Text("Reed Kuivila")
                    Text("reedkuivila@gmail.com")
                }
                
                Section(header: Text("Preferences")) {
                    Toggle("Enable Notifications", isOn: $enableNotifications)
                    Toggle("Private Profile", isOn: $privateProfile)
                    Toggle("Enable Face ID", isOn: $enableFaceID)
                }
                
                Section {
                    Button(action: saveDeveloperInfo) {
                        Text("Save")
                    }
                }
            
                Section {}
            footer: {footerView}
                        
              }
            .navigationTitle("Settings")
            .onAppear(perform: loadPreferences)
        }
    }
    
    private var footerView: some View {
        HStack {
            Spacer()
            VStack(alignment: .center, spacing: 8) {
                Text("© 2023 Preesh LLC")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Text("All rights reserved.")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Text("Version 1.0.0")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
    }
    
    func saveDeveloperInfo() {
        UserDefaults.standard.set(enableNotifications, forKey: "EnableNotifications")
        UserDefaults.standard.set(privateProfile, forKey: "PrivateProfile")
        UserDefaults.standard.set(enableFaceID, forKey: "EnableFaceID")
        
        presentationMode.wrappedValue.dismiss()
    }
    
    func loadPreferences() {
        enableNotifications = UserDefaults.standard.bool(forKey: "EnableNotifications")
        privateProfile = UserDefaults.standard.bool(forKey: "PrivateProfile")
        enableFaceID = UserDefaults.standard.bool(forKey: "EnableFaceID")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
