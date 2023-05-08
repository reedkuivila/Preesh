//
//  PreeshApp.swift
//  Preesh
//
//  Created by reed kuivila on 5/8/23.
//

import SwiftUI

@main
struct PreeshApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
