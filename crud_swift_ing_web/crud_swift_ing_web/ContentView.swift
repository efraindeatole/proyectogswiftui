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
    @State var seleccionado: Viga?
    @State var vigaArray = [Viga]()


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
                        coreDM.guardarViga(clv_obra:newclv_obra, clv_viga: newclv_viga, longitud: newlongitud,material:newmaterial,peso:newpeso)
                        newclv_obra=""
                        
                        mostrarProductos()
                    }
                    })
                {
                    Text("Agregar")
                }

                List{
                    ForEach(vigaArray,id:\.self){
                        Vigas in
                        VStack{
                            Text(Vigas.clv_viga ?? "")
                        }
                        .onTapGesture{
                            seleccionado = Vigas
                            clv_viga = Vigas.clv_viga ?? ""
                        }
                    }.onDelete(perform: {
                        indexSet in
                        indexSet.forEach({ index in
                        let vigaz = vigaArray[index]
                            coreDM.borrarViga(vigas: <#T##Viga#>)
                        mostrarProductos()
                        })
                    })
                }.padding()
                    .onAppear(perform: {mostrarProductos()})
            }
        }
    }
    func mostrarProductos(){
        vigaArray = coreDM.leerTodasLasVigas()
        }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: ManejadorCoreData())
    }
}
