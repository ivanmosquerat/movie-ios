//
//  Movie.swift
//  movie-app
//
//  Created by Ivan Mosquera on 7/9/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    let page:Int
    let results: [MovieData]
    let total_pages: Int
    let total_results: Int
}

struct MovieData: Decodable {
    let id: Int
    let title,originalTitle,overview,posterPath,backdropPath,originalLanguage, mediaType, releaseDate :String
    let voteAverage, voteCount, popularity:Double
    let adult, video:Bool
    let genreIds:[Int]
   
    
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
        
    }
  
    
}
