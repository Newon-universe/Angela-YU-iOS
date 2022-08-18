//
//  CoreDataTestApp.swift
//  CoreDataTest
//
//  Created by Kim Yewon on 2022/08/18.
//

import SwiftUI

@main
struct CoreDataTestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
