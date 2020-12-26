//
//  Utilities.swift
//  movie-app
//
//  Created by Ivan Mosquera on 21/12/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation

struct Utilities {
    
    
    /// Encoding query
    /// - Parameter urlString: String query
    /// - Returns: URL encoded
    func encodingUrl(urlString:String)-> URL{
        let encodingUrl = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlRequest = URL(string: encodingUrl)!
        return urlRequest
    }
    
    
    func setupLanguage(movie:MovieData) -> String {
        
        var languageText = "N/A"
        for language in LanguagesFlags{
            if (language.key == movie.originalLanguage){
                languageText = language.value
            }
        }
        
        return languageText
    }
}
