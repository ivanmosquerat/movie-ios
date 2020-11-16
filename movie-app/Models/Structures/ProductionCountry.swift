//
//  ProductionCountry.swift
//  movie-app
//
//  Created by Ivan Mosquera on 15/11/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation

struct ProductionCountry:Codable{
    let iso,
        name:String?
    
    static var `default`:ProductionCountry{
        .init(iso: "", name: "")
    }
    
    enum CodingKeys: String, CodingKey{
        case name
        case iso = "iso_3166_1"
    }
}
