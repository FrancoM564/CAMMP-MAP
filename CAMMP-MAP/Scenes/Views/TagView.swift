//
//  Tag.swift
//  CAMMP-MAP
//
//  Created by Franco Marquez on 5/08/22.
//

import SwiftUI

struct TagView: View {
    @State var showTag = true
    var tagInfo : String
    var action : () -> ()
    
    
    init(_ tag: String,_ actionBtn: @escaping ()->()){
        tagInfo = tag
        action = actionBtn
    }
    
    
    var body: some View {
        
        if showTag{
            HStack{
                Text(tagInfo)
                Button {
                    action()
                    showTag.toggle()
                } label: {
                    Image(uiImage: UIImage(systemName: "x.circle")!)
                }

            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 25.0)
                .stroke(Color.orange,lineWidth: 2.0))
        }
        
    }
}

