//
//  RoundedImageView.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 08/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        customiseContents()
    }
    
}

// MARK: - Private

private extension RoundedImageView {
    
    func customiseContents() {
        backgroundColor = .clear
        layer.cornerRadius = bounds.size.height/2
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.pinkishGrey.cgColor
        layer.masksToBounds = false
        clipsToBounds = true
    }
    
}
