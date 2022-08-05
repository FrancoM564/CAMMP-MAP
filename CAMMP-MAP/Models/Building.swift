//
//  Building.swift
//  CAMMP-MAP
//{
//"id": 7216,
//"title": "CASA ULLOA",
//"slug": "casa-ulloa",
//"anio": "1936",
//"featured_image": {
//  "thumbnail": "http://cammpdev.ulima.edu.pe/wp-content/uploads/2017/02/Vista-general-de-la-casa-130x130.jpg",
//  "medium": "http://cammpdev.ulima.edu.pe/wp-content/uploads/2017/02/Vista-general-de-la-casa-374x460.jpg",
//  "large": "http://cammpdev.ulima.edu.pe/wp-content/uploads/2017/02/Vista-general-de-la-casa.jpg"
//}
//  Created by Franco Marquez on 5/08/22.
//

import Foundation

struct Building : Decodable {
    let id: Int
    let title : String
    let slug : String
    let anio : String
    let featured_image : FeaturedImage?
}


struct FeaturedImage : Decodable{
    let thumbnail : String
    let medium : String
    let large : String
}
