//
//  Service.swift
//  MVVMReactive
//
//  Created by Lyrics on 2019/4/14.
//  Copyright © 2019 Albatross Lab. All rights reserved.
//

import Foundation
import RxSwift
import Moya

protocol ServiceType {
    
    associatedtype Target: TargetType
    var networking: Networking<Target> { get }
}

extension ServiceType {
    
    func request(_ target: Target) -> Single<Any> {
        return networking.request(target).mapJSON()
    }
    
    func requestWithoutMapping(_ target: Target) -> Single<Moya.Response> {
        return networking.request(target)
    }
    
    func requestObject<T: Codable>(_ target: Target, type: T.Type) -> Single<T> {
        return networking.request(target).map(T.self)
    }
    
    func requestArray<T: Codable>(_ target: Target, type: T.Type) -> Single<[T]> {
        return networking.request(target).map([T].self)
    }
}

struct Service: ServiceType {
    
    let networking: Networking<GitHubAPI>
    init(networking: Networking<Target> = Networking<GitHubAPI>()) {
        self.networking = networking
    }
    
    func organizationRepos(_ owner: String) -> Single<[Repository]> {
        let single = requestArray(.organizationRepos(owner: owner), type: Repository.self)
        return single
    }
}
