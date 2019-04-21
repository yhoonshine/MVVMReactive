//
//  RepositoryCellViewModel.swift
//  MVVMReactive
//
//  Created by Lyrics on 2019/4/15.
//  Copyright © 2019 Albatross Lab. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class RepositoryCellViewModel {
    
    let title: Driver<String>
    let subTitle: Driver<String>
    let detail: Driver<String>
    let imageUrl: Driver<URL?>
    let starCountText: Driver<String>
    let language: Driver<String>
    
    let repository: Repository
    
    init(with repository: Repository) {
        self.repository = repository
        title = Driver.just("\(repository.name ?? "")")
        subTitle = Driver.just("\(repository.owner?.login ?? "")")
        detail = Driver.just("\(repository.descriptionField ?? "")")
        starCountText = Driver.just("\((repository.stargazersCount ?? 0))")
        imageUrl = Driver.just(repository.owner?.avatarURL)
        language = Driver.just("\(repository.language ?? "")")
    }
}
