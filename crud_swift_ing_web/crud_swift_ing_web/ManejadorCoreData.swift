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
    func guardarViga(clv_obra:String,clv_viga:String,longitud:String,material:String,peso:String){
        
    }
    func leerTodasLasVigas()-> [Viga]{
        let fetchRequest:NSFetchRequest<Viga>=Viga.fetchRequest()
        do{
            return try persistentContainer.viewContext.fetch(fetchRequest)
        }
        catch{
            return []
        }
    }
    func borrarViga(arrayvigas : Viga){
        
    }
}
