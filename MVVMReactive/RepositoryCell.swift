//
//  RepositoryCell.swift
//  MVVMReactive
//
//  Created by Lyrics on 2019/4/15.
//  Copyright © 2019 Albatross Lab. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RepositoryCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var starCountLable: UILabel!
    let disposeBag = DisposeBag()

    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 3.0
        
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 5.0
        contentView.layer.shadowOpacity = 0.3
    }
    
    func bind(to viewModel: RepositoryCellViewModel) {
        viewModel.title
            .drive(titleLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.imageUrl
            .drive(iconImageView.rx.imageURL)
            .disposed(by: disposeBag)
        
        viewModel.subTitle
            .drive(subTitleLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.detail
            .drive(descLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.language
            .drive(languageLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.starCountText
            .drive(starCountLable.rx.text)
            .disposed(by: disposeBag)
    }
    
}
