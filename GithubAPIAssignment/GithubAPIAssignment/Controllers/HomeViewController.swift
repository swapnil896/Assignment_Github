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
    
    //MARK:- VC Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        initialConfiguration()
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
    }
    
    func applyStyle() {
        showingLabel.font = .system(AppConstants.FontSize.twelve)
    }
    
    func registerCellNib() {
        let nib = UINib(nibName: UsersTableViewCell.className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: UsersTableViewCell.className)
    }
    
}

//MARK:- API Handler

extension HomeViewController {
    
    
    
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
