//
//  Kingfisher+Rx.swift
//  MVVMReactive
//
//  Created by Lyrics on 2019/4/21.
//  Copyright © 2019 Albatross Lab. All rights reserved.
//

import Foundation
import Kingfisher
import RxSwift
import RxCocoa

extension Reactive where Base: UIImageView {
    
    public var imageURL: Binder<URL?> {
        return self.imageURL(withPlaceholder: nil)
    }
    
    public func imageURL(withPlaceholder placeholderImage: UIImage?, options: KingfisherOptionsInfo? = [.transition(.fade(0.35))]) -> Binder<URL?> {
        return Binder(self.base, binding: { (imageView, url) in
            imageView.kf.setImage(with: url,
                                  placeholder: placeholderImage,
                                  options: options,
                                  progressBlock: nil,
                                  completionHandler: { (result) in })
        })
    }
}
