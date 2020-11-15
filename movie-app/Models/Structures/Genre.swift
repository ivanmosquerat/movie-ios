//
//  Genre.swift
//  movie-app
//
//  Created by Ivan Mosquera on 8/11/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation

struct Genre:Codable {
    let id:Int?
    let name:String?
    
    static var `default`:Genre {
        .init(id: 0, name: "")
    }
}
