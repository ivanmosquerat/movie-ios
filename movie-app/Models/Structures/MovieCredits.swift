//
//  MovieCredits.swift
//  movie-app
//
//  Created by Ivan Mosquera on 8/11/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation

struct MovieCredits:Codable{
    let id:Int?
    let cast:[CastMember]?
    let crew:[CrewMember]?
    
    static var `default`:MovieCredits{
        .init(id: 0, cast: [], crew: [])
    }
    
    enum CodingKeys: String, CodingKey{
        case id
        case cast = "cast"
        case crew = "crew"
    }
}
