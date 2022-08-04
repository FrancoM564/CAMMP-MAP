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
    @State private var isShowingDetailView = false
    private var arrayTags = ["Tag1","Tag2","Tag3","Tag4","Tag5","Tag6","Tag7"]
    private var numberTags : Int{
        return arrayTags.count
    }
    private var thereAreTags = false
    
    var body: some View {
        
        NavigationView {
            
            VStack{
                HStack{
                    Text("Aqui va el text field")
                    Spacer()
                    Text("Aqui va el boton")
                }
                MainMapView(markerNow: $markerNow, markerTapped: $markerTapped)
                //Search tags
                HStack{
                    ScrollView(.horizontal){
                        HStack(spacing: 10.0){
                            ForEach (0 ..< numberTags) {
                                Text(arrayTags[$0])
                                Divider()
                            }
                        }
                        
                    }
                    Text("Coloca algunos filtros :)")
                        .foregroundColor(Color.gray)
                }.frame(maxWidth: .infinity,maxHeight: 50.0)
                
                
                //Settings Button
                Button(action: {
                    print("Hola")
                }, label: {
                    HStack{
                        Text("Filtros")
                            .frame(maxWidth:.infinity,maxHeight: 50.0)
                            .foregroundColor(.white)
                    }
                })
                .padding()
                .background(Color(UIColor(.orange)))
                .ignoresSafeArea(edges: .bottom)
            }.navigationTitle("C A M M P")
                .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

