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
    
    
    var body: some View {
        NavigationView{
            MainMapView(markerNow: $markerNow, markerTapped: $markerTapped)
            Text("SDSDSFSDFSDFsd")
            
        }
        
    }
}

struct MapSearchScene_Previews: PreviewProvider {
    static var previews: some View {
        MapSearchScene()
    }
}
