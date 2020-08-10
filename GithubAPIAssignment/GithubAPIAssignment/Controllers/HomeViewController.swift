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
    
    //MARK:- Private Properties
    
    private var usersList = [User]()
    
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
    
    func currentUser(_ indexPath: IndexPath) -> User? {
        if indexPath.row < usersList.count {
            return usersList[indexPath.row]
        }
        return nil
    }
    
    func navigateSearch() {
        let search = Storyboard.controller.search()
        let navigation = UINavigationController(rootViewController: search)
        navigation.modalPresentationStyle = .fullScreen
        present(navigation, animated: false) {
            search.showSearchBarView()
        }
    }
    
}

//MARK:- IBActions

extension HomeViewController {
    
    @IBAction func searchBarButtonTapped(_ sender: UIBarButtonItem) {
        navigateSearch()
    }
    
}

//MARK:- API Handler

extension HomeViewController {
    
    func fetchGithubUsers() {
        UserViewModel.shared.getGithubUsers(onSuccess: { [weak self] (users) in
            DispatchQueue.main.async {
                self?.handleUsersResponse(users)
            }
        }) { (error) in
            DispatchQueue.main.async {
                
            }
            print(error.localizedDescription)
        }
        
    }
    
    func handleUsersResponse(_ users: [User]?) {
        if let users = users {
            usersList = users
            showingLabel.text = "result(s)".precedingZeroShowing(usersList.count)
        }
        tableView.reloadData()
    }
    
}

//MARK:- UITableViewDataSource & UITableViewDelegate

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.className, for: indexPath) as! UsersTableViewCell
        if let user = currentUser(indexPath) {
            cell.user = user
        }
        return cell
    }
    
}
