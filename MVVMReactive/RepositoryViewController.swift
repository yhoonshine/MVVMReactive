//
//  RepositoryViewController.swift
//  MVVMReactive
//
//  Created by Lyrics on 2019/4/15.
//  Copyright © 2019 Albatross Lab. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class RepositoryViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.estimatedRowHeight = 80
        tableView.separatorStyle = .none
        return tableView
    }()
    
    let viewModel = RepositorysViewModel()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.register(UINib(nibName: "RepositoryCell", bundle: nil), forCellReuseIdentifier: "RepositoryCell")
        bindViewModel()
    }
    
    func bindViewModel() {
        let input = RepositorysViewModel.Input.init(trigger: Observable.just(()),
                                                    selection: tableView.rx.modelSelected(RepositoryCellViewModel.self).asDriver())
        let output = viewModel.transform(input: input)
        
        output.items
            .asDriver(onErrorJustReturn: [])
            .drive(tableView.rx.items(cellIdentifier: "RepositoryCell", cellType: RepositoryCell.self)) { tableView, viewModel, cell in
                cell.bind(to: viewModel)
            }
            .disposed(by: disposeBag)
        
        output.repositorySelected
            .drive(onNext: { viewModel in
                print("navigation \(viewModel.repository.value.fullName ?? "") repository detail ")
            })
            .disposed(by: disposeBag)
    }

}
