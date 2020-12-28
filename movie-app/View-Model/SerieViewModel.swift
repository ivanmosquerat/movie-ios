//
//  SerieViewModel.swift
//  movie-app
//
//  Created by Ivan Mosquera on 12/10/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation
import Alamofire

class SerieViewModel: NSObject {
    
    // MARK: - Properties
    private var apiService: ApiService!
    var bindTrendingSerieToController : (() -> ()) = {}
    var bindPopularSerieToController : (() -> ()) = {}
    var bindRatedSerieToController : (() -> ()) = {}
    
    private (set) var trendingSerieData:[SerieData]!{
        didSet{
            self.bindTrendingSerieToController()
        }
    }
    
    private (set) var popularSerieData:[SerieData]!{
        didSet{
            self.bindPopularSerieToController()
        }
    }
    
    private (set) var ratedSerieData:[SerieData]!{
        didSet{
            self.bindRatedSerieToController()
        }
    }
    
    // MARK: - Init
    override init(){
        super.init()
        self.apiService = ApiService()
        getTrendingSeries()
        getPopularSeries()
        getRatedSeries()
    }
    
    // MARK: - Public methods
    func getTrendingSeries(){
        self.apiService.getSeriesBySection(completion: {(trendingSerieData) in self.trendingSerieData = trendingSerieData}, url: SeriesConstants.trendingSeries)
    }
    
    func getPopularSeries(){
        self.apiService.getSeriesBySection(completion: {(popularSerieData) in self.popularSerieData = popularSerieData}, url: SeriesConstants.popularSeries)
    }
    
    func getRatedSeries(){
        self.apiService.getSeriesBySection(completion: {(ratedSerieData) in self.ratedSerieData = ratedSerieData}, url: SeriesConstants.ratedSeries)
    }
}
