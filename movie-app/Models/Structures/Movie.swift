//
//  Movie.swift
//  movie-app
//
//  Created by Ivan Mosquera on 7/9/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let page:Int
    let results: [MovieData]
    let total_pages: Int
    let total_results: Int
}

struct MovieData: Codable {
    let id,
        budget,
        revenue,
        runtime:Int?
    let title,
        originalTitle,
        overview,
        posterPath,
        backdropPath,
        originalLanguage,
        mediaType,
        releaseDate,
        homepage,
        imdbId,
        status,
        tagline:String?
    let voteAverage,
        voteCount,
        popularity:Double?
    let adult,
        video:Bool?
    let genreIds:[Int]?
    let genres:[Genre]?
    let belongsToCollection:[String]?
    let productionCompanies:[ProductionCompany]?
    let productionCountries:[Int]?
    let spokenLanguages:[Int]?
    
    static var `default`:MovieData{
        .init(id: 0, budget: 0, revenue: 0, runtime: 0, title: "", originalTitle: "", overview: "", posterPath: "", backdropPath: "", originalLanguage: "", mediaType: "", releaseDate: "", homepage: "", imdbId: "", status: "", tagline: "", voteAverage: 0.0, voteCount: 0.0, popularity: 0.0, adult: true, video: false, genreIds: [], genres: [], belongsToCollection: [], productionCompanies: [], productionCountries: [], spokenLanguages: [])
    }
    
    enum CodingKeys: String, CodingKey{
        
        case id
        case title = "title"
        case originalTitle = "original_title"
        case overview = "overview"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case mediaType = "media_type"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case popularity = "popularity"
        case adult = "adult"
        case video = "video"
        case genreIds = "genre_ids"
        case budget = "budget"
        case revenue = "revenue"
        case runtime
        case homepage = "homepage"
        case imdbId = "imdb_id"
        case status = "status"
        case tagline = "tagline"
        case genres = "genres"
        case belongsToCollection = "belongs_to_collection"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case spokenLanguages = "spoken_languages"
        
    }
  
    
}
