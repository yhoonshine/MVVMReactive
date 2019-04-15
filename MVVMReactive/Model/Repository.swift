//
//  Repository.swift
//  MVVMReactive
//
//  Created by Mango on 2019/4/15.
//  Copyright © 2019 Albatross Lab. All rights reserved.
//

import Foundation

struct Repository: Codable {
    
    var id: Int?
    var descriptionField: String?
    var name: String?
    var fullName: String?
    var language: String?
    var languageColor: String?
    var languagesURL: String?
    var license: License?
    var organization: User?
    var owner: User?
    var stargazersCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case descriptionField = "description"
        case name
        case fullName = "full_name"
        case language
        case languageColor
        case languagesURL = "languages_url"
        case license
        case organization
        case owner
        case stargazersCount = "stargazers_count"
    }
}
