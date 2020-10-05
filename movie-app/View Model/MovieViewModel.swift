//
//  MovieViewModel.swift
//  movie-app
//
//  Created by Ivan Mosquera on 20/9/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation
import Alamofire

class MovieviewModel: NSObject {
    
    private var apiService : ApiService!
    
    private (set) var trendingMovieData: [MovieData]! {
        didSet{
            self.bindTrendingMovieToController()
        }
    }
    private (set) var popularMovieData: [MovieData]! {
        didSet{
            self.bindPopularMovieController()
        }
    }
    
    var bindTrendingMovieToController : (() -> ()) = {}
    var bindPopularMovieController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService = ApiService()
        getTrendingMovies()
        //getPopularMovies()
    }
    
    
    func getTrendingMovies(){
        
        self.apiService.getMovieBySection(completion: { (trendingMovieData) in
            self.trendingMovieData = trendingMovieData
            
        }, url: Constants.Server.trendingMovies)
    }
    
    func getPopularMovies(){
        
        self.apiService.getMovieBySection(completion: { (trendingMovieData) in
            self.trendingMovieData = trendingMovieData
            
        }, url: Constants.Server.popularMovies)
    }
}
