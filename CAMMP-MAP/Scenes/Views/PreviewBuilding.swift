//
//  PreviewBuilding.swift
//  CAMMP-MAP
//
//  Created by Franco Marquez on 5/08/22.
//

import SwiftUI

struct PreviewBuilding: View {
    var body: some View {
        
        ZStack{
            Color.black
                .ignoresSafeArea(edges: .horizontal)
                .ignoresSafeArea(edges: .bottom)
                .opacity(0.45)
            VStack{
                Text("Titulo lugar")
                Image("Image")
                    .resizable()
                    .frame(maxWidth: 275.0, maxHeight: 275.0)
                Text("Descripcion")
                    .padding(.all)
                Button {
                    print("mas info")
                            DataFetchManager().fetchDataInitial()

                } label: {
                    Text("Mas Info")
                }
                .padding(.all)
            }
            
            
            
            
            
        }
    }
}
