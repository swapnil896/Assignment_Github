//
//  MessageBannerView.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 10/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import UIKit

class MessageBannerView: UIView {

    // MARK: - IBOutlets
    
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var detailLabel: UILabel!
    
    // MARK: - Public Properties
    
    var message: String? {
        didSet {
            if let msg = message {
                detailLabel.text = msg
            }
        }
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
  
}

// MARK: - IBActions

private extension MessageBannerView {
    
    @IBAction func gestureRecognized(_ sender: Any) {
        UIApplication.shared.keyWindow?.hideBanner()
    }
    
}

// MARK: - Private

private extension MessageBannerView {
    
    func configure() {
        containerView = loadNib()
        addSubview(containerView)
        
        containerView.frame = bounds
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        contentView.backgroundColor = .watermelon
        
        applyStyle()
    }
    
    func applyStyle() {
        detailLabel.font = .system(AppConstants.FontSize.fourteen)
        detailLabel.textColor = .white
    }
    
}
