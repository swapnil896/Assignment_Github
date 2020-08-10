//
//  UIWindow.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 10/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import UIKit

extension UIWindow {
    
    class var keyWindow: UIWindow? {
        return UIApplication.shared.keyWindow
    }
    
    func showBanner(_ message: String? = .youAreOffline) {
        let messageBanner = GlobalOutletHolder.shared.messageBanner
        guard !messageBanner.isDescendant(of: self) else {
            return
        }

        messageBanner.detailLabel.text = message
        addSubview(messageBanner)
        messageBanner.frame = CGRect(x: 0, y: -AppConstants.Height.hundred, width: UIScreen.main.bounds.width,
                                     height: AppConstants.Height.hundred)
        
        messageBanner.layoutIfNeeded()
        UIView.animate(withDuration: AppConstants.Delay.pointThree, delay: AppConstants.Delay.pointThree, options: .curveEaseOut, animations: {
            messageBanner.frame = messageBanner.frame.offsetBy(dx: 0, dy: AppConstants.Height.hundred)
            messageBanner.layoutIfNeeded()
        }, completion: { (success) in
            DispatchQueue.main.asyncAfter(deadline: .now() + AppConstants.Delay.three) {[weak self] in
                self?.hideBanner()
            }
        })
    }
    
    func hideBanner() {
        let messageBanner = GlobalOutletHolder.shared.messageBanner
        guard messageBanner.isDescendant(of: self) else {
            return
        }
        
        messageBanner.layoutIfNeeded()
        UIView.animate(withDuration: AppConstants.Delay.pointThree, delay: 0, options: .curveEaseIn, animations: {
            messageBanner.frame = messageBanner.frame.offsetBy(dx: 0, dy: -AppConstants.Height.hundred)
            messageBanner.layoutIfNeeded()
        }, completion: { (success) in
            messageBanner.removeFromSuperview()
        })
    }
    
}
