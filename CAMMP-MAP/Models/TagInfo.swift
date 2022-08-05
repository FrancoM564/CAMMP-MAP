//
//  Tag.swift
//  CAMMP-MAP
//
//  Created by Franco Marquez on 5/08/22.
//

import Foundation
import SwiftUI

struct TagInfo: Hashable{
    
    static func == (lhs: TagInfo, rhs: TagInfo) -> Bool {
        return lhs.tagString == rhs.tagString && lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    @ObservedObject var dataFetchManager = DataFetchManager()
    
    
    
    var id : Int{
        print(dataFetchManager.numberObjects())
        return dataFetchManager.numberObjects() + 1
    }
    var tagString : String
    
    init(_ tag : String) {
        self.tagString = tag
    }
    
    
}

