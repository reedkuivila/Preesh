//
//  PreeshApp.swift
//  Preesh
//
//  Created by reed kuivila on 5/18/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {

    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct PreeshApp: App {
    @StateObject var viewModel = AuthViewModel()

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            NavigationView {
                LoginView()
//                ContentView()
            }
            .environmentObject(viewModel)

        }
    }
}
