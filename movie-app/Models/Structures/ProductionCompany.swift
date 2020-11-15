//
//  ProductionCompany.swift
//  movie-app
//
//  Created by Ivan Mosquera on 15/11/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation

struct ProductionCompany:Codable {
    let id:Int?
    let name,
        logoPath,
        originCountry:String?
    
    static var `default`:ProductionCompany{
        .init(id: 0, name: "", logoPath: "", originCountry: "")
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case logoPath = "logo_path"
        case originCountry = "origin_country"
    }
}
