//
//  ApiConfiguration.swift
//  movie-app
//
//  Created by Ivan Mosquera on 20/9/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation
import Alamofire

protocol ApiConfiguration: URLRequestConvertible {
    var method: HTTPMethod {get}
    var path: String {get}
    var parameters: RequestParams { get }
}
