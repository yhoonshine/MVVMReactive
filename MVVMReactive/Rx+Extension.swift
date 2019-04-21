//
//  Rx+Extension.swift
//  MVVMReactive
//
//  Created by Lyrics on 2019/4/21.
//  Copyright © 2019 Albatross Lab. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UIView {
    var backgroundColor: Binder<UIColor?> {
        return Binder(self.base) { view, backgroundColor in
            view.backgroundColor = backgroundColor
        }
    }
}
