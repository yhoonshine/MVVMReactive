//
//  RepositoryDetailsViewModel.swift
//  MVVMReactive
//
//  Created by Lyrics on 2019/4/21.
//  Copyright © 2019 Albatross Lab. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class RepositoryDetailsViewModel {
    
    let repository: BehaviorRelay<Repository>
    
    init(repository: Repository) {
        self.repository = BehaviorRelay(value: repository)
    }
}
