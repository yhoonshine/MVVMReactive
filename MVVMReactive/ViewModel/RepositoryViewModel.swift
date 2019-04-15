//
//  RepositoryViewModel.swift
//  MVVMReactive
//
//  Created by Mango on 2019/4/15.
//  Copyright © 2019 Albatross Lab. All rights reserved.
//

import Foundation

class RepositoryViewModel: ViewModelType {
    private lazy var apiService = Service()
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(input: RepositoryViewModel.Input) -> RepositoryViewModel.Output {
        return Output()
    }
}
