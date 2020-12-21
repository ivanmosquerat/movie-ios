//
//  Serie.swift
//  movie-app
//
//  Created by Ivan Mosquera on 12/10/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation

struct Serie: Codable{
    let page:Int
    let results: [SerieData]
    let total_pages: Int
    let total_results: Int
}

struct SerieData: Codable {
    let backdropPath,
        firstAirDate,
        homepage,
        lastAirDate,
        name,
        originalLanguage,
        originalName,
        overview,
        posterPath,
        status,
        tagline,
        type:String?
    let id,
        numberOfEpisodes,
        numberOfSeasons:Int?
    let popularity,
        voteAverage,
        voteCount: Double?
    let lastEpisodeToAir:Episode?
    let nextEpisodeToAir:Episode?
    let inProduction:Bool?
    let languages:[String]?
    let originCountry:[String]?
    let episodeRunTime:[Int]?
    let createdBy:[CrewMember]?
    let genres:[Genre]?
    let productionCompanies:[ProductionCompany]?
    let productionCountries:[ProductionCountry]?
    let seasons:[Season]?
    let spokenLanguages:[Language]?
    let networks:[Networks]?
    
    static var `default`:SerieData{
        .init(backdropPath: "", firstAirDate: "", homepage: "", lastAirDate: "", name: "", originalLanguage: "", originalName: "", overview: "", posterPath: "", status: "", tagline: "", type: "", id: 0, numberOfEpisodes: 0, numberOfSeasons: 0, popularity: 0.0, voteAverage: 0.0, voteCount: 0.0, lastEpisodeToAir: Episode.default, nextEpisodeToAir: Episode.default, inProduction: true, languages: [], originCountry: [], episodeRunTime: [], createdBy: [], genres: [], productionCompanies: [], productionCountries: [], seasons: [], spokenLanguages: [], networks: [])
    }
    
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
        case lastEpisodeToAir = "last_episode_to_air"
        case nextEpisodeToAir = "next_episode_to_air"
        case productionCountries = "production_countries"
        case spokenLanguages = "spoken_languages"
        case tagline
    }
    
}


