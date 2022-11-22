//
//  ContentView.swift
//  crud_swift_ing_web
//
//  Created by CCDM15 on 17/11/22.
//

import SwiftUI
import CoreData



struct ContentView: View {
    let coreDM: ManejadorCoreData
    @State var clv_obra = ""
    @State var clv_viga = ""
    @State var longitud = ""
    @State var material = ""
    @State var peso = ""
    @State var newclv_obra = ""
    @State var newclv_viga = ""
    @State var newlongitud = ""
    @State var newmaterial = ""
    @State var newpeso = ""
    @State var seleccionado: crud_swift_ing_webApp?
    @State var vigaArray = [crud_swift_ing_webApp]()


    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: VStack{
                    TextField("clave obra", text: self.$newclv_obra).multilineTextAlignment(.center)
                    TextField("clave viga", text: self.$newclv_viga).multilineTextAlignment(.center)
                    TextField("longitud", text: self.$newlongitud).multilineTextAlignment(.center)
                    TextField("material", text: self.$newmaterial).multilineTextAlignment(.center)
                    TextField("peso", text: self.$newpeso).multilineTextAlignment(.center)

                    Button("Guardar"){
                        coreDM.guardarMobilaria(clv_obra:newclv_obra, clv_viga: newclv_viga, longitud: newlongitud,material:newmaterial,peso:newpeso)
                        newclv_obra=""
                        
                        mostrarProductos()
                    }
                    }){
                    Text("Agregar")
                }

                List{
                    ForEach(vigaArray, id: \.self){
                        Viga in
                        VStack{
                            Text(Viga.clv_viga ?? "")
                        }
                        .onTapGesture{
                            seleccionado = prod
                            codigo = prod.idmob ?? ""
                        }
                    }.onDelete(perform: {
                        indexSet in
                        indexSet.forEach({ index in
                        let viga = vigaArray[index]
                            coreDM.borrarMobiliaria(mobiliaria: producto)
                        mostrarProductos()
                        })
                    })
                }.padding()
                    .onAppear(perform: {mostrarProductos()})
            }
        }
    }
    func mostrarProductos(){
            prodArray = coreDM.leerTodosLosProductos()
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}
