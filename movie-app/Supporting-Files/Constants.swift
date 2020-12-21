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
            
            static let search = "\(EndPoints.domain)search/movie\(EndPoints.apiKey)&query="
        }
        
        struct Series {
            static let trendingSeries = "\(EndPoints.domain)\(EndPoints.Series.trendingSeries)\(EndPoints.apiKey)"
            static let popularSeries = "\(EndPoints.domain)\(EndPoints.Series.popularSeries)\(EndPoints.apiKey)"
            static let ratedSeries = "\(EndPoints.domain)\(EndPoints.Series.ratedSeries)\(EndPoints.apiKey)"
        }
        
    }
    
    struct cellIds{
        static let resultItemCellId = "ResultItemTableViewCell"
    }
}


enum HttpReaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
        case string = "String"
}


enum ContentType: String {
    case json = "Application/json"
    case formEncode = "application/x-www-form-urlencoded"
}

enum RequestParams {
    case body(_:Parameters)
    case url(_:Parameters)
}
