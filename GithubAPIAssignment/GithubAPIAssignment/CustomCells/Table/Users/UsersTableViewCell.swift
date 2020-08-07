//
//  UsersTableViewCell.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 08/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import UIKit

class UsersTableViewCell: UITableViewCell {
    
    //MARK:- IBOutlets
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userScoreLabel: UILabel!
    @IBOutlet weak var viewDetailsButton: UIButton!
    
    //MARK:- Nib Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        applyStyle()
    }
    
}

//MARK:- Private

private extension UsersTableViewCell {
    
    func applyStyle() {
        userNameLabel.textColor = .black40
        userScoreLabel.textColor = .blackt60
        viewDetailsButton.titleLabel?.textColor = .navigationBar
        userNameLabel.font = .system(AppConstants.FontSize.fourteen)
        userScoreLabel.font = .system(AppConstants.FontSize.fourteen)
        viewDetailsButton.titleLabel?.font = .systemMedium(AppConstants.FontSize.twelve)
    }
    
}

//MARK:- IBActions

extension UsersTableViewCell {
    
    @IBAction func viewDetailsButtonTapped(_ sender: UIButton) {
        
    }
    
}
