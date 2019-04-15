//
//  RepositoryCellViewModel.swift
//  MVVMReactive
//
//  Created by Mango on 2019/4/15.
//  Copyright © 2019 Albatross Lab. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class RepositoryCellViewModel {
    let title: Driver<String>
    let detail: Driver<String>
    let secondDetail: Driver<String>
    let imageUrl: Driver<String>
    
    let repository: Repository
    
    init(with repository: Repository) {
        self.repository = repository
        title = Driver.just("\(repository.fullName ?? "")")
        detail = Driver.just("\(repository.descriptionField ?? "")")
        secondDetail = Driver.just("★ \((repository.stargazersCount ?? 0)) \t\(repository.language ?? "")")
        imageUrl = Driver.just(repository.owner?.avatar ?? "")
    }
}
