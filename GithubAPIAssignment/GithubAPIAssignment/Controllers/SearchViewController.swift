//
//  SearchViewController.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 09/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import UIKit

class SearchViewController: BaseViewController {
    
    //MARK:- IBOutlets
    
    @IBOutlet weak var searchBarView: SearchBarView!
    @IBOutlet weak var sortByView: UIView!
    @IBOutlet weak var sortByButton: UIButton!
    @IBOutlet weak var showingLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var paginationView: UIView!
    @IBOutlet weak var paginationLoader: UIActivityIndicatorView!
    @IBOutlet weak var searchViewHeightConstraint: NSLayoutConstraint!
    
    //MARK:- Public Properties
    
    var searchedUsersList = [SearchedUser]()
    
    //MARK:- VC Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        applyStyle()
        configureSearchBarView()
        registerCellNib()
        hideViews()
        hideSearchBarView(withoutAnimation: true)
    }
    
    //MARK:- BaseViewController
    
    override func isHideNavigationBar() -> Bool {
        return true
    }

}

//MARK:- Public

extension SearchViewController {
    
    func showSearchBarView() {
        searchViewHeightConstraint.constant = 44
        weak var welf = self
        
        UIView.animate(withDuration: AppConstants.Delay.pointThree, animations: {
            welf?.view.layoutIfNeeded()
        }) { finished in
            welf?.searchBarView.searchBar.becomeFirstResponder()
        }
    }
    
}

//MARK:- Private

private extension SearchViewController {
    
    func applyStyle() {
        searchBarView.backgroundColor = .navigationBar
    }
    
    func registerCellNib() {
        let nib = UINib(nibName: UsersTableViewCell.className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: UsersTableViewCell.className)
    }
    
    func configureSearchBarView() {
        searchBarView.delegate = self
    }
    
    func currentUser(_ indexPath: IndexPath) -> SearchedUser? {
        if indexPath.row < searchedUsersList.count {
            return searchedUsersList[indexPath.row]
        }
        return nil
    }
    
    func hideViews() {
        //validationView.isHidden = true
        tableView.isHidden = true
    }
    
    func hideSearchBarView(withoutAnimation animate: Bool) {
        searchViewHeightConstraint.constant = 0
        weak var welf = self
        
        if animate {
            view.layoutIfNeeded()
        } else {
            UIView.animate(withDuration: AppConstants.Delay.pointThree, animations: {
                welf?.view.layoutIfNeeded()
            }) { finished in
                welf?.searchBarView.searchBar.resignFirstResponder()
                welf?.dismiss(animated: false, completion: nil)
            }
        }
    }
    
}

//MARK:- API Handler

extension SearchViewController {
    
    func searchUser() {
        UserViewModel.shared.searchUsers(searchBarView.searchBar.text! , onSuccess: { [weak self] (searchedUsers) in
            DispatchQueue.main.async {
                self?.handleSearchedUsersResponse(searchedUsers)
            }
        }) { (error) in
            DispatchQueue.main.async {
                
            }
            print(error.localizedDescription)
        }
        
    }
    
    func handleSearchedUsersResponse(_ users: SearchedUsers?) {
        if let users = users {
            searchedUsersList = users.items
            showingLabel.text = "result(s)".precedingZeroShowing(searchedUsersList.count)
        }
        tableView.isHidden = false
        tableView.reloadData()
    }
    
}

//MARK:- UITableViewDataSource & UITableViewDelegate

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedUsersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.className, for: indexPath) as! UsersTableViewCell
        if let user = currentUser(indexPath) {
            cell.searchedUser = user
        }
        return cell
    }
    
}

// MARK: - SearchBarViewDelegate

extension SearchViewController: SearchBarViewDelegate {
    
    func searchBarView(_ searchBar: TopSearchBar, textDidChange text: String) { }
    
    func didSearchBarDidBeginEditing(_ searchBar: TopSearchBar) {
        hideViews()
    }
    
    func didCancelButtonTapped() {
        hideSearchBarView(withoutAnimation: false)
    }
    
    func didKeyboardSearchTapped(_ searchBar: TopSearchBar) {
        searchBar.resignFirstResponder()
        searchUser()
    }
    
}
