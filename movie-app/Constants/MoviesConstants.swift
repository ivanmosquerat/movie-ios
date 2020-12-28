//
//  MoviesConstants.swift
//  movie-app
//
//  Created by Ivan Mosquera on 28/12/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation

struct MoviesConstants {
    
    static let trendingMovies = "\(EndPoints.domain)\(EndPoints.Movies.trendingMovie)\(EndPoints.apiKey)"
    
    static let popularMovies = "\(EndPoints.domain)\(EndPoints.Movies.popularMovie)\(EndPoints.apiKey)"
    
    static let ratedMovies = "\(EndPoints.domain)\(EndPoints.Movies.ratedMovie)\(EndPoints.apiKey)"
    
    static let upcomingMovies = "\(EndPoints.domain)\(EndPoints.Movies.upcomingMovie)\(EndPoints.apiKey)"
    
    static let moviesBySection:[String:[MovieData]] = [
        "Trending":[MovieData](),
        "Popular":[MovieData](),
        "Rated":[MovieData](),
        "Upcoming":[MovieData](),
    ]
    
    static let sectionsTitles:[String] = ["Trending","Popular","Rated","Upcoming"]
    
    static let search = "\(EndPoints.domain)search/movie\(EndPoints.apiKey)&query="
}
