//
//  RepositoryViewController.swift
//  MVVMReactive
//
//  Created by Mango on 2019/4/15.
//  Copyright © 2019 Albatross Lab. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class RepositoryViewController: UITableViewController {
    
    let viewModel = RepositoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func bindViewModel() {
        let input = RepositoryViewModel.Input.init(trigger: Observable.just(()))
        let output = viewModel.transform(input: input)
        
//        output.items
//            .asDriver(onErrorJustReturn: [])
//            .drive(tableView.rx.items(cellIdentifier: "reuseIdentifier", cellType: RepositoryCell.self)) { tableView, viewModel, cell in
//                cell.bind(to: viewModel)
//            }.disposed(by: rx.disposeBag)
    }

}
