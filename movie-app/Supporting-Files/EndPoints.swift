//
//  EndPoints.swift
//  movie-app
//
//  Created by Ivan Mosquera on 7/9/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation

struct EndPoints {
    static let domain = "https://api.themoviedb.org/3/"
    static let apiKey = "?api_key=744dc706fad11b55f470ebbec1761849"
    static let imageUrlBase = "https://image.tmdb.org/t/p/original"
    
    
    static let trendingMovie = "trending/movie/week"
    static let popularMovie = "movie/popular"
    static let ratedMovie = "movie/top_rated"
    static let upcomingMovie = "movie/upcoming"
    
    struct Movies {
        static let movieBase = "https://api.themoviedb.org/3/movie/"
        static let movieCredits = "/credits"
    }
    
    struct Series {
        static let trendingSeries = "trending/tv/week"
        static let popularSeries = "tv/popular"
        static let ratedSeries = "tv/top_rated"
        static let serieBase = "https://api.themoviedb.org/3/tv/"
        static let serieCredits = "/credits"
        static let serieSeasonDetails = "/season/"
    }
    
}
