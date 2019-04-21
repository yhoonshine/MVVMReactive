//
//  RepositorysViewModel.swift
//  MVVMReactive
//
//  Created by Lyrics on 2019/4/21.
//  Copyright © 2019 Albatross Lab. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class RepositorysViewModel: ViewModelType {
    
    private lazy var apiService = Service()
    let disposeBag = DisposeBag()
    
    struct Input {
        let trigger: Observable<Void>
        let selection: Driver<RepositoryCellViewModel>
    }
    
    struct Output {
        var items: BehaviorRelay<[RepositoryCellViewModel]>
        var repositorySelected: Driver<RepositoryDetailsViewModel>
    }
    
    func transform(input: RepositorysViewModel.Input) -> RepositorysViewModel.Output {
        
        let items = BehaviorRelay<[RepositoryCellViewModel]>(value: [])
        
        input.trigger
            .flatMap { self.requestData() }
            .subscribe(onNext: { item in
                items.accept(item)
            })
            .disposed(by: disposeBag)
        
        let repositoryDetails = input
            .selection
            .map { RepositoryDetailsViewModel(repository: $0.repository) }
        
        return Output(items: items, repositorySelected:repositoryDetails)
    }
    
    func requestData() -> Observable<[RepositoryCellViewModel]> {
        return apiService.organizationRepos("apple")
            .asObservable()
            .map { $0.map { RepositoryCellViewModel(with: $0) } }
    }
}
