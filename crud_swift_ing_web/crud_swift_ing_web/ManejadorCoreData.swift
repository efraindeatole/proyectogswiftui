//
//  ManejadorCoreData.swift
//  crud_swift_ing_web
//
//  Created by CCDM15 on 22/11/22.
//

import Foundation
import CoreData

class ManejadorCoreData{
    let persistentContainer: NSPersistentContainer

    init(){
        persistentContainer = NSPersistentContainer(name: "Viga")
        persistentContainer.loadPersistentStores(completionHandler:{
            (descripcion, error) in
            if let error = error {
                fatalError("Core data failed \(error.localizedDescription)")
            }
        })
    }
}
