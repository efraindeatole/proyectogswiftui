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
        persistentContainer = NSPersistentContainer(name: "Vigas")
        persistentContainer.loadPersistentStores(completionHandler:{
            (descripcion, error) in
            if let error = error {
                fatalError("Core data failed \(error.localizedDescription)")
            }
        })
    }
    func guardarViga(clv_obra:String,clv_viga:String,longitud:String,material:String,peso:String){
        let viga = Viga(context:persistentContainer .viewContext)
        viga.clv_viga=clv_viga
        viga.clv_obra=clv_obra
        viga.peso=peso
        viga.longitud=longitud
        viga.material=material
        do{
            try persistentContainer.viewContext.save()
                print("si se guardo")
            
        }
        catch{
            print("no se guardo")
        }
    }
    func leerTodasLasVigas()-> [Viga]{
        let fetchRequest:NSFetchRequest<Viga> = Viga.fetchRequest()
        do{
            return try persistentContainer.viewContext.fetch(fetchRequest)
        }catch{
            return []
        }
       
    }
    func actualizarViga(laviga:Viga){
        let fetchRequest:NSFetchRequest<Viga>=Viga.fetchRequest()
        let predicated=NSPredicate(format:"clv_viga=%@",laviga.clv_viga ?? "")
        fetchRequest.predicate=predicated
        do{
            let datos = try persistentContainer.viewContext.fetch(fetchRequest)
            let p = datos.first
            p?.clv_viga=laviga.clv_viga
            p?.material=laviga.material
            p?.clv_obra=laviga.clv_obra
            p?.longitud=laviga.longitud
            p?.peso=laviga.peso
            try persistentContainer.viewContext.save()
            print("viga acualizada")
            
        }catch{
            print("no se guardo")
        }
        
    }
    func borrarViga(vigas:Viga){
        persistentContainer.viewContext.delete(vigas)
        do{
            try persistentContainer.viewContext.save()
        }catch{
            persistentContainer.viewContext.rollback()
            print("trono")
        }
    }
    
    func leerViga(clv_viga:String)->Viga?{
        let fetchrequest:NSFetchRequest<Viga> = Viga.fetchRequest()
        let predicated = NSPredicate(format:"clv_viga=%@",clv_viga)
        fetchrequest.predicate = predicated
        do{
            let datos = try persistentContainer.viewContext.fetch(fetchrequest)
            return datos.first
        }catch{
            print("failed to save error en ")
        }
        return nil
    }
}
