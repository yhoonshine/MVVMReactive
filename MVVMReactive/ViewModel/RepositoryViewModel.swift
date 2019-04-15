//
//  RepositoryViewModel.swift
//  MVVMReactive
//
//  Created by Mango on 2019/4/15.
//  Copyright © 2019 Albatross Lab. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class RepositoryViewModel: ViewModelType {
    private lazy var apiService = Service()
    
    struct Input {
        let trigger: Observable<Void>
    }
    
    struct Output {
        var items: BehaviorRelay<[Repository]>
        
    }
    
    func transform(input: RepositoryViewModel.Input) -> RepositoryViewModel.Output {
        
        let items = BehaviorRelay<[Repository]>(value: [])
        
        
        return Output(items: items)
    }
}
