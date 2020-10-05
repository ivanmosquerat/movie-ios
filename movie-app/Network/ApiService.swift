//
//  ApiService.swift
//  movie-app
//
//  Created by Ivan Mosquera on 5/10/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation
import Alamofire


class ApiService: NSObject {
    
    private let trendingMoviesUrl = Constants.Server.trendingMovies
    private let popularMoviesUrl = Constants.Server.popularMovies
    
    func getMovieBySection(completion: @escaping ([MovieData]) -> (), url: String){
        
        guard let url = URL(string: url) else {return}
        
        AF.request(url, method: .get, parameters: nil).response{(response: AFDataResponse<Data?>) in
            
            switch response.result{
            case .success(_):
                
                
                if let data = response.data {
                    let dataFromService = try! JSONDecoder().decode(Movie.self, from: data)
                    completion(dataFromService.results)
                }
                
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
    
//    func getPopularMovies(completion: @escaping ([MovieData]) -> ()){
//
//        guard let url = URL(string: popularMoviesUrl) else {return}
//
//        AF.request(url, method: .get, parameters: nil).response{(response: AFDataResponse<Data>) in
//
//            switch response.result{
//
//            }
//        }
//    }
}
