//
//  Season.swift
//  movie-app
//
//  Created by Ivan Mosquera on 22/11/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation

struct Season:Codable{
    let id,
        seasonNumber:Int?
    let _id,
        airDate,
        name,
        overview,
        posterPath: String?
    let episodeCount:Int?
    let episodes:[Episode]?
    
    static var `default`:Season{
        .init(id: 0, seasonNumber: 0, _id: "", airDate: "", name: "", overview: "", posterPath: "", episodeCount: 0, episodes: [])
    }
    
    enum CodingKeys: String, CodingKey{
        case id
        case seasonNumber = "season_number"
        case _id = "_id"
        case airDate = "air_date"
        case name
        case overview
        case posterPath = "poster_path"
        case episodes
        case episodeCount = "episode_count"
    }
        
}
