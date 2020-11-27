//
//  ApiService.swift
//  movie-app
//
//  Created by Ivan Mosquera on 5/10/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation
import Alamofire
import NotificationBannerSwift

class ApiService: NSObject {
    
    // MARK: - Movies methods
    
    func getMovieBySection(completion: @escaping ([MovieData]) -> (), url: String){
        
        guard let url = URL(string: url) else {return}
        
        AF.request(url, method: .get, parameters: nil).response{(response: AFDataResponse<Data?>) in
            
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
    
    func getMovieDetails(completion: @escaping (MovieData) -> (), url:String){
        
        guard let url = URL(string: url) else { return }
        
        AF.request(url, method: .get, parameters: nil).response{(response: AFDataResponse<Data?>) in
            switch response.result{
            
            case .success(_):
                if response.response?.statusCode == 200 {
                    if let data = response.data{
                        let dataFromService = try! JSONDecoder().decode(MovieData.self, from: data)
                        completion(dataFromService)
                    }else{
                        NotificationBanner(title: "Error", subtitle: response.error?.errorDescription, leftView: nil, rightView: nil, style: .warning, colors: nil).show()
                    }
                }
            case .failure(_):
                
                NotificationBanner(title: "Error", subtitle: response.error?.errorDescription, leftView: nil, rightView: nil, style: .warning, colors: nil).show()
            }
        }
    }
    
    func getMovieCredits(completion: @escaping (MovieCredits) -> (), url:String){
        
        guard let url = URL(string: url) else { return }
        
        AF.request(url, method: .get, parameters: nil).response{(response: AFDataResponse<Data?>) in
            
            switch response.result{
            
            case .success(_):
                
                if response.response?.statusCode == 200 {
                    if let data = response.data{
                        let dataFromService = try! JSONDecoder().decode(MovieCredits.self, from: data)
                        completion(dataFromService)
                        
                    }
                    
                }else{
                    NotificationBanner(title: "Error", subtitle: response.error?.errorDescription, leftView: nil, rightView: nil, style: .warning, colors: nil).show()
                }
                
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
    // MARK: - Series methods
    
    func getSeriesBySection(completion: @escaping ([SerieData]) -> (), url: String){
        
        guard let url = URL(string: url) else {return}
        
        AF.request(url, method: .get, parameters: nil).response{(response: AFDataResponse<Data?>)in
            
            switch response.result {
            
            case .success(_):
                
                if response.response?.statusCode == 200{
                    if let data = response.data{
                        let dataFromService = try! JSONDecoder().decode(Serie.self, from: data)
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
    
    func getSerieDetails(completion: @escaping (SerieData) -> (), url:String){
        
        guard let url = URL(string: url) else { return }
        
        AF.request(url, method: .get, parameters: nil).response{(response: AFDataResponse<Data?>) in
            
            switch response.result{
            
            case .success(_):
                if response.response?.statusCode == 200 {
                    if let data = response.data{
                        let dataFaromService = try! JSONDecoder().decode(SerieData.self, from: data)
                        completion(dataFaromService)
                        
                    }else{
                        NotificationBanner(title: "Error", subtitle: response.error?.errorDescription, leftView: nil, rightView: nil, style: .warning, colors: nil).show()
                    }
                }
                
            case .failure(_):
                
                NotificationBanner(title: "Error", subtitle: response.error?.errorDescription, leftView: nil, rightView: nil, style: .warning, colors: nil).show()
            }
        }
    }
    
    // MARK: - Seasons methods
    func getSeasonsDetails(){}
    
    // MARK: - Person methods
    func getPersonDetails(completion: @escaping (Person) -> (), url:String){
        
        guard let url = URL(string: url) else { return }
        
        AF.request(url, method: .get, parameters: nil).response{(response: AFDataResponse<Data?>) in
            
            switch response.result{
            
            case .success(_):
                if response.response?.statusCode == 200{
                    if let data = response.data{
                        let dataFromService = try! JSONDecoder().decode(Person.self, from: data)
                        completion(dataFromService)
                        
                    }else{
                        NotificationBanner(title: "Error", subtitle: response.error?.errorDescription, leftView: nil, rightView: nil, style: .warning, colors: nil).show()
                    }
                }
                
            case .failure(_):
                NotificationBanner(title: "Error", subtitle: response.error?.errorDescription, leftView: nil, rightView: nil, style: .warning, colors: nil).show()
            }
        }
        
    }
}
