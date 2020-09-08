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
    let posterPath: String
    let voteAverage:Double
}
