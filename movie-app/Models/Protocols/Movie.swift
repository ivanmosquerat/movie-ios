//
//  Movie.swift
//  movie-app
//
//  Created by Ivan Mosquera on 7/10/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation

protocol ProtocolMovie: Codable{
    var adult:Bool { get }
    var backdropPath:String { get }
    var belongsToCollection:[Any] { get }
    var budget:Int { get }
    var genres:[Any] { get }
    var homepage:String { get }
    var id:Int { get }
    var imdbId:String { get }
    var originalLanguage:String { get }
    var originalTitle:String { get }
    var overview:String { get }
    var popularity:Double { get }
    var posterPath:String { get }
    var productionCompanies:[Any] { get }
    var productionCountries:[Any] { get }
    var releaseDate:String { get }
    var revenue:Int { get }
    var runtime:Int { get }
    var spokenLanguages:[Any] { get }
    var status:String { get }
    var tagline:String { get }
    var title:String { get }
    var video:Bool { get }
    var voteAverage:Double { get }
    var voteCount:Double { get }
    
}
