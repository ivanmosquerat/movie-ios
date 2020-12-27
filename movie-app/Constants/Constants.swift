//
//  Constants.swift
//  movie-app
//
//  Created by Ivan Mosquera on 10/9/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation
import Alamofire

struct Constants {
    struct Server {
        static let trendingMovies = "\(EndPoints.domain)\(EndPoints.trendingMovie)\(EndPoints.apiKey)"
        static let popularMovies = "\(EndPoints.domain)\(EndPoints.popularMovie)\(EndPoints.apiKey)"
        static let ratedMovies = "\(EndPoints.domain)\(EndPoints.ratedMovie)\(EndPoints.apiKey)"
        static let upcomingMovies = "\(EndPoints.domain)\(EndPoints.upcomingMovie)\(EndPoints.apiKey)"
        
        struct Movies {
            
            static let moviesBySection:[String:[MovieData]] = [
                "Trending":[MovieData](),
                "Popular":[MovieData](),
                "Rated":[MovieData](),
                "Upcoming":[MovieData](),
            ]
            
            static let sectionsTitles:[String] = ["Trending","Popular","Rated","Upcoming"]
            
            static let search = "\(EndPoints.domain)search/movie\(EndPoints.apiKey)&query="
        }
        
        struct Series {
            
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
        
    }
    
    struct cellIds{
        
        static let movieSectionCellId = "MovieSectionTableViewCell"
        
        static let movieItemCellId = "ItemMovieCollectionViewCell"
        
        static let serieSectionCellId = "SectionSerieTableViewCell"
        
        static let serieItemCellId = "ItemSerieCollectionViewCell"
        
        static let personCellId = "PersonCollectionViewCell"
        
        static let seasonCellId = "SeasonItemCollectionViewCell"
        
        static let resultItemCellId = "ResultItemTableViewCell"
    }
    
    struct Segues{
        
        static let segueToSerieDetail = "showSerieDetail"
        
        static let segueToPersonDetail = "showPersonDetail"
        
        static let segueToMovieDetail = "segueToMovieDetail"
    }
}



