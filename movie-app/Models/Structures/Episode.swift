//
//  Episode.swift
//  movie-app
//
//  Created by Ivan Mosquera on 22/11/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation

struct Episode:Codable {
    let airDate,
        name,
        overview,
        stillPath,
        productionCode: String?
    let id,
        episodeNumber,
        seasonNumber,
        voteCount: Int?
    let voteAverage: Double?
    let crew:[CrewMember]
    let guestStars:[CastMember]
    
    static var `default`:Episode{
        .init(airDate: "", name: "", overview: "", stillPath: "", productionCode: "", id: 0, episodeNumber: 0, seasonNumber: 0, voteCount: 0, voteAverage: 0.0, crew: [], guestStars: [])
    }
    
    enum CodingKeys: String, CodingKey{
        case id
        case airDate = "air_date"
        case name
        case overview
        case stillPath = "still_path"
        case productionCode = "production_code"
        case episodeNumber = "episode_number"
        case seasonNumber = "season_number"
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case crew
        case guestStars = "guest_stars"
    }
    
}
