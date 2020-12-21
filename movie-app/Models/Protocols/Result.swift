//
//  Result.swift
//  movie-app
//
//  Created by Ivan Mosquera on 19/12/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation

protocol Result {
    var page:Int { get }
    var total_pages: Int { get }
    var total_results: Int { get }
}
