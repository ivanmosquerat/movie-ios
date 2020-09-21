//
//  Movie.swift
//  movie-app
//
//  Created by Ivan Mosquera on 7/9/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let title:String
    let original_title: String
    let overview: String
    let poster_path: String
    let vote_average:Double
    let adult:Bool
    let genre_ids:[Int]
    let backdrop_path:String
    let original_language:String
    let release_date: String
    let video:Bool
    let vote_count:Double
    let popularity:Double
    let media_type:String
    
}
