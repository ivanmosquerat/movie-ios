//
//  SeriesConstants.swift
//  movie-app
//
//  Created by Ivan Mosquera on 28/12/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation

struct SeriesConstants {
    
    static let sectionsTitles = ["Trending","Popular","Rated"]
    
    static let seriesBySection:[String:[SerieData]] = [
        "Trending":[SerieData](),
        "Popular":[SerieData](),
        "Rated":[SerieData](),
    ]
    
    static let trendingSeries = "\(EndPoints.domain)\(EndPoints.Series.trendingSeries)\(EndPoints.apiKey)"
    
    static let popularSeries = "\(EndPoints.domain)\(EndPoints.Series.popularSeries)\(EndPoints.apiKey)"
    
    static let ratedSeries = "\(EndPoints.domain)\(EndPoints.Series.ratedSeries)\(EndPoints.apiKey)"
}
