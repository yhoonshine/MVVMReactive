//
//  User.swift
//  MVVMReactive
//
//  Created by Lyrics on 2019/4/15.
//  Copyright © 2019 Albatross Lab. All rights reserved.
//

import Foundation

struct User: Codable {
    
    var avatarURL: URL?
    var login: String?
    
    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
        case login
    }
}
