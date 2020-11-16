//
//  Language.swift
//  movie-app
//
//  Created by Ivan Mosquera on 16/11/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation

struct Language:Codable {
    let iso,
        englishName,
        name:String?
    
    static var `default`:Language{
        .init(iso: "", englishName: "", name: "")
    }
    
    enum CodingKeys: String, CodingKey{
        case name
        case englishName = "english_name"
        case iso = "iso_639_11"
    }
}
