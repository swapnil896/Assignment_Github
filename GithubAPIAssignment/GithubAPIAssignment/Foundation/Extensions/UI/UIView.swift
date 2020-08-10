//
//  UIView.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 09/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import UIKit
import SVProgressHUD

extension UIView {
    
    func showHUD(_ message: String? = .loading) {
        //SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.show(withStatus: message)
    }
    
    func hideHUD() {
        DispatchQueue.main.async {
            if SVProgressHUD.isVisible() {
                SVProgressHUD.dismiss()
            }
        }
    }
    
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return (nib.instantiate(withOwner: self, options: nil).first as? UIView)!
    }
    
}
