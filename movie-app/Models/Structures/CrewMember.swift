//
//  CrewMember.swift
//  movie-app
//
//  Created by Ivan Mosquera on 8/11/20.
//  Copyright © 2020 Ivan Mosquera. All rights reserved.
//

import Foundation

struct CrewMember:Codable {
    
    let id,
        gender:Int?
    let department,
        job,
        creditId,
        name,
        profilePath:String?
        
    static var `default`:CrewMember{
        .init(id: 0, gender: 0, department: "", job: "", creditId: "", name: "", profilePath: "")
    }
    
    enum CodingKeys: String, CodingKey{
        case id
        case gender = "gender"
        case department = "department"
        case job = "job"
        case creditId = "credit_id"
        case name = "name"
        case profilePath = "profile_path"
    }
}
