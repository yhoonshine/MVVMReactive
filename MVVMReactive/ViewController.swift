//
//  ViewController.swift
//  MVVMReactive
//
//  Created by Lyrics on 2019/4/14.
//  Copyright © 2019 Albatross Lab. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    
    let service = Service()
    let disposeBag = DisposeBag()
    
    let viewModel = RepositoryViewModel()

    lazy var lable: UILabel = {
        let lable = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 44)))
        lable.center = view.center
        return lable
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(lable)
        let organizationRepos = service.organizationRepos("apple").subscribe(onSuccess: { repos in
            print(repos.count)
        }) { error in
            print(error.localizedDescription)
        }
    }
    
    func bindViewModel() {
        let input = RepositoryViewModel.Input.init(trigger: Observable.just(()))
        let output = viewModel.transform(input: input)
        output.items
            .asDriver(onErrorJustReturn: []).drive()
    }
}

