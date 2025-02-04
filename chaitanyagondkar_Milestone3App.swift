//
//  chaitanyagondkar_Milestone3App.swift
//  chaitanyagondkar_Milestone3
//
//  Created by admin on 04/02/25.
//

import SwiftUI

@main
struct chaitanyagondkar_Milestone3App: App {
    let persitenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext,persitenceController.container.viewContext)
        }
    }
}
