//
//  Actor.swift
//  movie-app
//
//  Created by Ivan Mosquera on 28/10/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation

struct Person:Codable{
    
    let id,
        gender:Int?
    let popularity:Double?
    let adult:Bool?
    let birthday,
        knownForDepartment,
        deathday,
        name,
        biography,
        placeOfBirth,
        profilePath,
        imdbId,
        homepage:String?
    let alsoKnownAs:[String]?
    
    static var `default`: Person{
        .init(id: 0, gender: 0, popularity: 0.0, adult: false, birthday: "", knownForDepartment: "", deathday: "", name: "", biography: "", placeOfBirth: "", profilePath: "", imdbId: "", homepage: "", alsoKnownAs: [])
    }
    
    enum CodingKeys: String, CodingKey{
        case id
        case adult = "adult"
        case birthday = "birthday"
        case knownForDepartment = "known_for_department"
        case deathday = "deathday"
        case name = "name"
        case alsoKnownAs = "also_known_as"
        case gender = "gender"
        case biography = "biography"
        case popularity = "popularity"
        case placeOfBirth = "place_of_birth"
        case profilePath = "profile_path"
        case imdbId = "imdb_id"
        case homepage = "homepage"
    }
}

