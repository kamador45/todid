//
//  TaskApp.swift
//  Task
//
//  Created by Kevin Amador Rios on 6/22/22.
//

import SwiftUI

@main
struct TaskApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Home()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
