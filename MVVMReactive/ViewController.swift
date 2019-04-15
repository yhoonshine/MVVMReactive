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


}

