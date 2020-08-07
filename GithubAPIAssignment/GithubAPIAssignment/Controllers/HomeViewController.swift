//
//  HomeViewController.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 06/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    //MARK:- IBOutlets
    
    @IBOutlet weak var sortByButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var showingLabel: UILabel!
    @IBOutlet weak var paginationView: UIView!
    @IBOutlet weak var paginationLoader: UIActivityIndicatorView!
    
    //MARK:- VC Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        initialConfiguration()
        fetchGithubUsers()
    }
    
    //MARK:- BaseViewController
    
    override func isHideBackButton() -> Bool {
        return true
    }
    
}

//MARK:- Private

private extension HomeViewController {
    
    func initialConfiguration() {
        self.title = .home
        applyStyle()
        registerCellNib()
        hidePaginationLoader(true)
    }
    
    func applyStyle() {
        showingLabel.font = .system(AppConstants.FontSize.twelve)
        showingLabel.textColor = .black136
        showingLabel.text = "result(s)".precedingZeroShowing(10)
        
        sortByButton.setTitle(.sortBy, for: .normal)
        sortByButton.titleLabel?.font = .system(AppConstants.FontSize.fourteen)
        sortByButton.setTitleColor(.black136, for: .normal)
    }
    
    func registerCellNib() {
        let nib = UINib(nibName: UsersTableViewCell.className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: UsersTableViewCell.className)
    }
    
    func hidePaginationLoader(_ shouldHide: Bool) {
        if shouldHide {
            paginationLoader.stopAnimating()
            paginationView.isHidden = true
        } else {
            paginationView.isHidden = false
            paginationLoader.startAnimating()
        }
    }
    
}

//MARK:- IBActions

extension HomeViewController {
    
    @IBAction func searchBarButtonTapped(_ sender: UIBarButtonItem) {
        
    }
    
}

//MARK:- API Handler

extension HomeViewController {
    
    func fetchGithubUsers() {
        
        
    }
    
}

//MARK:- UITableViewDataSource & UITableViewDelegate

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.className, for: indexPath) as! UsersTableViewCell
        
        return cell
    }
    
}
