//
//  Githup_AppApp.swift
//  Githup App
//
//  Created by Danang Wijaya on 29/04/21.
//

import SwiftUI

@main
struct Githup_AppApp: App {
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
