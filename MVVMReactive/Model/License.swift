//
//  License.swift
//  MVVMReactive
//
//  Created by Mango on 2019/4/15.
//  Copyright © 2019 Albatross Lab. All rights reserved.
//

import Foundation

struct License: Codable {
    var key: String?
    var name: String?
    var nodeID: String?
    var spdxID: String?
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        case key
        case name
        case url
        case nodeID = "node_id"
        case spdxID = "spdx_id"
    }
}
