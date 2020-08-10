//
//  ToastPopupManager.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 10/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import Foundation
import Toast_Swift

class ToastPopupManager {
    
    // MARK: - Singleton
    
    static let shared = ToastPopupManager()
    
    // MARK: Initialization
    
    private init() {
        configure()
    }
    
}

// MARK: - Public

extension ToastPopupManager {
    
    func show(message: String) {
        ToastManager.shared.style = style()
        if let keyWindow = UIWindow.keyWindow {
            keyWindow.makeToast(message, point: CGPoint(x: ((keyWindow.screen.bounds.width) / 2), y: ((keyWindow.screen.bounds.height) - 100)),
                                                      title: nil, image: nil, completion: nil)
        }
    }
    
    func hide(from view: UIView) {
        view.hideToast(view)
    }
    
}

// MARK: - Private

private extension ToastPopupManager {
    
    func configure() {
        ToastManager.shared.isTapToDismissEnabled = true
        ToastManager.shared.isQueueEnabled = false
    }
    
    func style() -> ToastStyle {
        var style = ToastStyle()
        style.messageColor = .white
        style.messageFont = UIFont.system(AppConstants.FontSize.fourteen)
        return style
    }
    
}
