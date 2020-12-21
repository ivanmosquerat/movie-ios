//
//  Result.swift
//  movie-app
//
//  Created by Ivan Mosquera on 19/12/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation

struct ResultMovies: Codable, Result{
    let page:Int
    let results:[MovieData]
    let total_pages: Int
    let total_results: Int
}
