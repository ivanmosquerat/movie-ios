//
//  ApiRouter.swift
//  movie-app
//
//  Created by Ivan Mosquera on 10/9/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation
import Alamofire

enum ApiRouter: ApiConfiguration{
    
    
    // MARK: - Cases
    case getTrendingMovies
    case getPopularMovies
    case getRatedMovies
    case getUpcomingMovies
    
    // MARK: - HTTPMethod
    var method: HTTPMethod{
        switch self {
            case .getTrendingMovies:
                return .get
            case .getPopularMovies:
                return .get
            case .getRatedMovies:
                return .get
            case .getUpcomingMovies:
                return .get
        }
        
    }
    
    // MARK: - Parameters
    var parameters: RequestParams{
        switch self {
            case .getTrendingMovies:
                return .body([:])
            case .getPopularMovies:
                return .body([:])
            case .getRatedMovies:
                return .body([:])
            case .getUpcomingMovies:
                return .body([:])
        }
        
    }
    
    // MARK: - Path
    var path: String{
        switch self {
        case .getTrendingMovies:
            return EndPoints.trendingMovie
        
        case .getPopularMovies:
            return EndPoints.popularMovie
            
        case .getRatedMovies:
            return ""
            
        case .getUpcomingMovies:
            return ""
        }
    }
    
    
    // MARK: - URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.Server.trendingMovies.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HttpReaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HttpReaderField.contentType.rawValue)
        
        switch parameters {
        
        case .body(let params):
            debugPrint(params)
            //urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
        
        case .url(let params):
            let queryParams = params.map{ pair in
                return URLQueryItem(name: pair.key, value: "\(pair.value)")
            }
            
            var components = URLComponents(string: url.appendingPathComponent(path).absoluteString)
            components?.queryItems = queryParams
            urlRequest.url = components?.url
       
        }
        
        return urlRequest
    }
    
}
