//
//  crud_swift_ing_webApp.swift
//  crud_swift_ing_web
//
//  Created by CCDM15 on 17/11/22.
//

import SwiftUI

@main
struct crud_swift_ing_webApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(vigas)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        
    }
}
