//
//  WinterTodoApp.swift
//  WinterTodo
//
//  Created by Geunil Park on 2022/06/04.
//

import SwiftUI

@main
struct WinterTodoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
