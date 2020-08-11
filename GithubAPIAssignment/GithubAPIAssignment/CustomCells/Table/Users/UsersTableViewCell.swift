//
//  UsersTableViewCell.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 08/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import UIKit
import SDWebImage

class UsersTableViewCell: UITableViewCell {
    
    //MARK:- IBOutlets
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userScoreLabel: UILabel!
    @IBOutlet weak var viewDetailsButton: UIButton!
    
    //MARK:- Public Properties
    
    var user: User? {
        didSet {
            loadData()
        }
    }
    
    var searchedUser: SearchedUser? {
        didSet {
            loadSearchData()
        }
    }
    
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
        viewDetailsButton.setTitle(.viewDetails, for: .normal)
    }
    
    func loadData() {
        if let user = user {
            userNameLabel.text = user.login
            userScoreLabel.isHidden = true
            let imageURL = URL(string: user.avatarURL)
            userImageView.sd_setImage(with: imageURL, placeholderImage: #imageLiteral(resourceName: "userPlaceholder"), options: .refreshCached, completed: nil)
        }
    }
    
    func loadSearchData() {
        if let user = searchedUser {
            userNameLabel.text = user.login
            userScoreLabel.text = "Score " + "\(user.score)"
            let imageURL = URL(string: user.avatarURL)
            userImageView.sd_setImage(with: imageURL, placeholderImage: #imageLiteral(resourceName: "userPlaceholder"), options: .refreshCached, completed: nil)
        }
    }
    
}

//MARK:- IBActions

extension UsersTableViewCell {
    
    @IBAction func viewDetailsButtonTapped(_ sender: UIButton) {
        
    }
    
}
