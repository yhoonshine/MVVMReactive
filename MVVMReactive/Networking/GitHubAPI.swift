//
//  GitHubAPI.swift
//  MVVMReactive
//
//  Created by Lyrics on 2019/4/14.
//  Copyright © 2019 Albatross Lab. All rights reserved.
//

import Foundation
import Moya

enum GitHubAPI {
    case feeds
    case organizationRepos(owner: String)
}

extension GitHubAPI: Moya.TargetType {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    var path: String {
        switch self {
        case .feeds:
            return "/feeds"
        case .organizationRepos(let owner):
            return "/orgs/\(owner)/repos"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
}
