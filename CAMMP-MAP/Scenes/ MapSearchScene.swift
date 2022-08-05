//
//  ContentView.swift
//  CAMMP-MAP
//
//  Created by Franco Marquez on 4/08/22.
//

import SwiftUI
import GoogleMaps

struct MapSearchScene: View {
    
    @State var markerNow : GMSMarker?
    @State var markerTapped : Bool?
    @State private var arrayTags = [String]()
    @State private var tagTextField = ""
    
    func changeStrings(){
        if arrayTags.isEmpty{
            self.arrayTags = ["Tag1","Tag2","Tag3","Tag4","Tag5","Tag6","Tag7"]
        }
        else{
            self.arrayTags = []
        }
    }
    
    var body: some View {
        
        NavigationView {
            VStack{
                
                //Add search tag
                HStack{
                    TextField("Busqueda por nombre de edificos", text: $tagTextField)
                        .padding()
                    Spacer()
                    Button("Buscar"){
                        arrayTags.append(tagTextField)
                        tagTextField = ""
                        print(arrayTags)
                    }.padding()
                        .frame(alignment: .leading)
                }
                .frame(maxHeight:60.0)
                MainMapView(markerNow: $markerNow, markerTapped: $markerTapped)
                //Search tags
                HStack{
                    if arrayTags.isEmpty {
                        Text("Coloca algunos filtros :)")
                            .foregroundColor(Color.gray)
                    }else{
                        ScrollView(.horizontal){
                            HStack(spacing: 10.0){
                                ForEach(arrayTags,id: \.self) { tag in
                                    Text(tag)
                                }
                            }
                        }
                        .padding()
                        
                        
                        
                    }
                    
                }.frame(maxWidth: .infinity,maxHeight: 50.0)
                
                
                //Settings Button
                Button(action: {
                    changeStrings()
                }, label: {
                    HStack{
                        Text("Filtros")
                            .frame(maxWidth:.infinity)
                            .foregroundColor(.white)
                    }
                })
                .padding()
                .background(Color(UIColor(.orange)))
                .ignoresSafeArea(edges: .bottom)
            }
            .navigationTitle("C A M M P")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink {
                    Text("Hola")
                } label: {
                    Label {
                        Text("")
                    } icon: {
                        Image("Image")
                            .resizable()
                            .frame(width: 30.0, height: 30.0)
                    }
                    
                }
                .frame(alignment: .trailing)
                .padding()
                
                
            }
        }
        
    }
}




extension View {
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    ///
    ///     Text("Label")
    ///         .isHidden(true)
    ///
    /// Example for complete removal:
    ///
    ///     Text("Label")
    ///         .isHidden(true, remove: true)
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
