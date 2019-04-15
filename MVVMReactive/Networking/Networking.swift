//
//  Networking.swift
//  MVVMReactive
//
//  Created by Lyrics on 2019/4/14.
//  Copyright © 2019 Albatross Lab. All rights reserved.
//

import Foundation
import Moya
import RxSwift

final class Networking<Target: TargetType>: MoyaProvider<Target> {
    init(plugins: [PluginType] = []) {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Manager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 10
        
        let manager = Manager(configuration: configuration)
        manager.startRequestsImmediately = false
        super.init(manager: manager, plugins: plugins)
    }
    
    func request(_ token: Target) -> Single<Moya.Response> {
        let requestString = "\(token.method) \(token.path)"
        return self.rx.request(token)
            .filterSuccessfulStatusCodes()
            .do(onSuccess: { value in
                let message = "SUCCESS: \(requestString) (\(value.statusCode))"
                print(message)
            },
                onError: { error in
                    if let response = (error as? MoyaError)?.response {
                        if let jsonObject = try? response.mapJSON(failsOnEmptyData: false) {
                            let message = "FAILURE: \(requestString) (\(response.statusCode))\n\(jsonObject)"
                            print(message)
                        } else if let rawString = String(data: response.data, encoding: .utf8) {
                            let message = "FAILURE: \(requestString) (\(response.statusCode))\n\(rawString)"
                            print(message)
                        } else {
                            let message = "FAILURE: \(requestString) (\(response.statusCode))"
                            print(message)
                        }
                    } else {
                        let message = "FAILURE: \(requestString)\n\(error)"
                        print(message)
                    }
            }, onSubscribe: {
                let message = "REQUEST: \(requestString)"
                print(message)
            })
    }
}


