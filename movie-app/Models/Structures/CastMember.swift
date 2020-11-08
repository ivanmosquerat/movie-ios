//
//  CastMember.swift
//  movie-app
//
//  Created by Ivan Mosquera on 8/11/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation

struct CastMember:Codable {
    
    let id,
        castId,
        gender,
        order:Int?
    let character,
        creditId,
        name,
        profilePath:String?
        
    static var `default`:CastMember{
        .init(id: 0, castId: 0, gender: 0, order: 0, character: "", creditId: "", name: "", profilePath: "")
    }
    
    enum CodingKeys: String, CodingKey{
        case id
        case castId = "cast_id"
        case gender = "gender"
        case order = "order"
        case character = "character"
        case creditId = "credit_id"
        case name = "name"
        case profilePath = "profile_path"
    }
}
