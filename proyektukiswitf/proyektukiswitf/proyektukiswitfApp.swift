//
//  proyektukiswitfApp.swift
//  proyektukiswitf
//
//  Created by CCDM15 on 17/11/22.
//

import SwiftUI

@main
struct proyektukiswitfApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
