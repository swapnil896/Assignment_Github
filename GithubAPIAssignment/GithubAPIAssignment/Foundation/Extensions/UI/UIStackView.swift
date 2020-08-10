//
//  UIStackView.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 09/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import UIKit

extension UIStackView {
    
    func clearBackground() {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = .clear
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
    
}
