//
//  ApiService.swift
//  movie-app
//
//  Created by Ivan Mosquera on 5/10/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD
import NotificationBannerSwift

class ApiService: NSObject {
    
    private let trendingMoviesUrl = Constants.Server.trendingMovies
    private let popularMoviesUrl = Constants.Server.popularMovies
    
    func getMovieBySection(completion: @escaping ([MovieData]) -> (), url: String){
        
        //SVProgressHUD.show()
        guard let url = URL(string: url) else {return}
        
        AF.request(url, method: .get, parameters: nil).response{(response: AFDataResponse<Data?>) in
            
            //SVProgressHUD.dismiss()
            switch response.result{
            case .success(_):
                
                if response.response?.statusCode == 200{
                    if let data = response.data {
                        let dataFromService = try! JSONDecoder().decode(Movie.self, from: data)
                        completion(dataFromService.results)
                    }
                }else{
                    NotificationBanner(title: "Error", subtitle: response.error?.errorDescription, leftView: nil, rightView: nil, style: .warning, colors: nil).show()
                }
                
                
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
    
}
