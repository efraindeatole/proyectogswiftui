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
    @State var picando=false

    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: VStack{
                    TextField("clave obra", text: self.$newclv_obra).textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("clave viga", text: self.$newclv_viga).textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("longitud", text: self.$newlongitud).textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("material", text: self.$newmaterial).textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("peso", text:
                                self.$newpeso).textFieldStyle(RoundedBorderTextFieldStyle())

                    Button("Guardar"){
                        coreDM.guardarViga(clv_obra:newclv_obra, clv_viga: newclv_viga, longitud: newlongitud,material:newmaterial,peso:newpeso)
                        newclv_obra=""
                        newmaterial=""
                        newclv_viga=""
                        newlongitud=""
                        newpeso=""
                        
                        mostrarProductos()
                    }
                }.padding())
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
                            clv_obra=Vigas.clv_obra ?? ""
                            material=Vigas.material ?? ""
                            longitud=Vigas.longitud ?? ""
                            peso=Vigas.peso ?? ""
                            picando.toggle()
                        }
                    }.onDelete(perform: {
                        indexSet in
                        indexSet.forEach({ index in
                        let vigao = vigaArray[index]
                            coreDM.borrarViga(vigas: vigao)
                        mostrarProductos()
                        })
                    })
                }.padding()
                    .onAppear(perform: {mostrarProductos()})
            
            NavigationLink("",destination: VStack{
                TextField("clave obra", text: self.$clv_obra).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("clave viga", text: self.$clv_viga).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("longitud", text:
                            self.$longitud).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("material", text:
                            self.$material).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("peso", text:
                            self.$peso).textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Actualizar"){
                    seleccionado?.clv_viga=clv_viga
                    seleccionado?.clv_obra=clv_obra
                    seleccionado?.longitud=longitud
                    seleccionado?.material=material
                    seleccionado?.peso=peso
                    coreDM.actualizarViga(laviga: seleccionado!)
                    clv_viga=""
                    clv_obra=""
                    material=""
                    peso=""
                    longitud=""
                    mostrarProductos()
                }
                
            },isActive: $picando)
        }
    }
}
    func mostrarProductos(){
        vigaArray=coreDM.leerTodasLasVigas()
    }
}


       
struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView(coreDM: ManejadorCoreData())
            }
        }

    


