//
//  Serie.swift
//  movie-app
//
//  Created by Ivan Mosquera on 12/10/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation



struct Serie: Decodable{
    let page:Int
    let results: [SerieData]
    let total_pages: Int
    let total_results: Int
}

struct SerieData: Decodable {
    let backdropPath, firstAirDate, homepage, lastAirDate, name, originalLanguage,
        originalName, overview, posterPath, status, type:String?
    let id, numberOfEpisodes, numberOfSeasons:Int?
    let popularity, voteAverage, voteCount: Double?
    let inProduction:Bool?
    let languages:[String]?
    let originCountry:[String]?
    let episodeRunTime:[Int]?
    
    let createdBy:[String]?
    let genres:[String]?
    let networks:[String]?
    let productionCompanies:[String]?
    let seasons:[String]?
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case homepage = "homepage"
        case lastAirDate = "last_air_date"
        case name = "name"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview = "overview"
        case posterPath = "poster_path"
        case status = "status"
        case type = "type"
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case popularity = "popularity"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case inProduction = "in_production"
        case languages = "languages"
        case originCountry = "origin_country"
        case episodeRunTime = "episode_run_time"
        case createdBy = "created_by"
        case genres = "genres"
        case networks = "networks"
        case productionCompanies = "production_companies"
        case seasons = "seasons"
    }
    
}


