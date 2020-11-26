//
//  Networks.swift
//  movie-app
//
//  Created by Ivan Mosquera on 26/11/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation

struct Networks:Codable {
    let id:Int?
    let headquarters,
        homepage,
        logoPath,
        name,
        originCountry:String?
    
    static var `default`:Networks{
        .init(id: 0, headquarters: "", homepage: "", logoPath: "", name: "", originCountry: "")
    }
    
    enum CodingKeys: String, CodingKey{
        case id
        case headquarters
        case homepage
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}
