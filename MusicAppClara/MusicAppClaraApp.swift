//
//  MusicAppClaraApp.swift
//  MusicAppClara
//
//  Created by Gabriel Rico on 28/9/24.
//

import SwiftUI

@main
struct MusicAppClaraApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
