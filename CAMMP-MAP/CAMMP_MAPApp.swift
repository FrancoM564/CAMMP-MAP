//
//  CAMMP_MAPApp.swift
//  CAMMP-MAP
//
//  Created by Franco Marquez on 4/08/22.
//

import SwiftUI
import GoogleMaps

@main
struct CAMMP_MAPApp: App {
    
    init() {
        GMSServices.provideAPIKey("")
    }
    
    
    
    var body: some Scene {
        WindowGroup {
            MapSearchScene()
        }
    }
}
