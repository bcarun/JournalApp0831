//
//  JournalApp0831App.swift
//  JournalApp0831
//
//  Created by Arun Chandrasekaran on 8/31/24.
//

import SwiftUI
import SwiftData

@main
struct JournalApp0831App: App {
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Journal.self,
        ])
        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(sharedModelContainer)
        }
    }
}
