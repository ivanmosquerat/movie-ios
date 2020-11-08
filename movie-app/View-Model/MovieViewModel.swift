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
    
    // MARK: - Properties
    private var apiService : ApiService!
    var bindTrendingMovieToController : (() -> ()) = {}
    var bindPopularMovieController : (() -> ()) = {}
    var bindRatedMovieController : (() -> ()) = {}
    var bindUpcomingMovieController : (() -> ()) = {}
    var bindMovieCreditsController : (() -> ()) = {}
    
    private (set) var trendingMovieData:[MovieData]! {
        didSet{
            self.bindTrendingMovieToController()
        }
    }
    
    private (set) var popularMovieData: [MovieData]! {
        didSet{
            self.bindPopularMovieController()
        }
    }
    
    private (set) var ratedMovieData: [MovieData]! {
        didSet{
            self.bindRatedMovieController()
        }
    }
    
    private (set) var upcomingMovieData: [MovieData]! {
        didSet{
            self.bindUpcomingMovieController()
        }
    }
    
    private (set) var movieCreditsData: MovieCredits! {
        didSet{
            self.bindMovieCreditsController()
        }
    }
    
    // MARK: - Init
    
    override init() {
        super.init()
        self.apiService = ApiService()
        getTrendingMovies()
        getPopularMovies()
        getRatedMovies()
        getMoviesUpcoming()
    }
    
    init(movieId:Int) {
        super.init()
        getMovieCredits(movieId: movieId)
    }
    
    // MARK: - Public methods
    
    func getTrendingMovies(){
        
        self.apiService.getMovieBySection(completion: { (trendingMovieData) in
            self.trendingMovieData = trendingMovieData
        }, url: Constants.Server.trendingMovies)
    }
    
    func getPopularMovies(){
        
        self.apiService.getMovieBySection(completion: { (popularMovieData) in
            self.popularMovieData = popularMovieData
        }, url: Constants.Server.popularMovies)
    }
    
    func getRatedMovies(){
        
        self.apiService.getMovieBySection(completion: {(ratedMovieData) in
            self.ratedMovieData = ratedMovieData
        }, url: Constants.Server.ratedMovies)
    }
    
    func getMoviesUpcoming(){
        self.apiService.getMovieBySection(completion: {(upcomingMovieData) in
            self.upcomingMovieData = upcomingMovieData
        }, url: Constants.Server.upcomingMovies)
    }
    
    func getMovieCredits(movieId:Int){
        
        self.apiService.getMovieCredits(completion: {(movieCreditsData) in
            
            self.movieCreditsData = movieCreditsData
            
        }, url: "\(EndPoints.Movies.movieBase)\(movieId)\(EndPoints.Movies.movieCredits)\(EndPoints.apiKey)")
    }
}
