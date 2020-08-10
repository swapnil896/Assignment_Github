//
//  TopSearchBar.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 09/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import UIKit

class TopSearchBar: UITextField {
    
    // MARK: - Nib Loading
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        customiseContents()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 32, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
    
}

// MARK: - Private

private extension TopSearchBar {
    
    func customiseContents() {
        insertImage()
        
        returnKeyType = .search
        leftViewMode = .always
        contentVerticalAlignment = .center
        clearButtonMode = .whileEditing
        layer.cornerRadius = AppConstants.CornerRadius.ten
        
        applyStyle()
    }
    
    func applyStyle() {
        backgroundColor = .white80
        font = UIFont.system(AppConstants.FontSize.seventeen)
    }
    
    func insertImage() {
        let view = UIView(frame: CGRect(x: frame.origin.x, y: frame.origin.y, width: 26, height: 13))
        let image = UIImageView(image: #imageLiteral(resourceName: "search"))
        image.center = view.center
        view.addSubview(image)
        leftView = view
    }
    
}
