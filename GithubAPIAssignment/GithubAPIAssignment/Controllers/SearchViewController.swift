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
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    //MARK:- Public Properties
    
    var searchedUsersList = [SearchedUser]()
    
    //MARK:- Private Properties
    
    private var isPaginationListLoading = false
    private var isAllRecordsFetched = false
    private var pageNumber = 1
    
    //MARK:- VC Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        applyStyle()
        configureSearchBarView()
        registerCellNib()
        hideViews()
        hidePaginationLoader()
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
    
    func configureSearchBarView() {
        searchBarView.delegate = self
    }
    
    func handleNetwork() {
        if Reachability.isConnectedToNetwork() {
            searchUser(true)
        } else {
            UIApplication.shared.keyWindow?.showBanner()
        }
    }
    
    func currentUser(_ indexPath: IndexPath) -> SearchedUser? {
        if indexPath.row < searchedUsersList.count {
            return searchedUsersList[indexPath.row]
        }
        return nil
    }
    
    func setupInitialPage() {
        isPaginationListLoading = false
        isAllRecordsFetched = false
        pageNumber = 1
    }
    
    func hideViews() {
        showingLabel.isHidden = true
        tableView.isHidden = true
        sortByView.isHidden = true
    }
    
    func showViews() {
        showingLabel.isHidden = false
        tableView.isHidden = false
        sortByView.isHidden = false
    }
    
    func showPaginationLoader() {
        isPaginationListLoading = true
        paginationView.isHidden = false
        paginationLoader.isHidden = false
        paginationLoader.startAnimating()
    }
    
    func hidePaginationLoader() {
        isPaginationListLoading = false
        paginationLoader.stopAnimating()
        paginationView.isHidden = true
    }
    
    func showListLoader() {
        loader.isHidden = false
        loader.startAnimating()
    }
    
    func hideListLoader() {
        loader.stopAnimating()
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
    
    func searchUser(_ isFirstFetch: Bool) {
        if Reachability.isConnectedToNetwork() {
            if isFirstFetch {
                showListLoader()
            }
            UserViewModel.shared.searchUsers(searchUserParameters() , onSuccess: { [weak self] (searchedUsers) in
                DispatchQueue.main.async {
                    if isFirstFetch {
                        self?.hideListLoader()
                    } else {
                        self?.hidePaginationLoader()
                    }
                    self?.handleSearchedUsersResponse(searchedUsers)
                }
            }) { [weak self] (error) in
                self?.hidePaginationLoader()
                ToastPopupManager.shared.show(message: error.localizedDescription)
            }
        } else {
            handleNetwork()
        }
    }
    
    func searchUserParameters() -> [String: Any] {
        var params = [String: Any]()
        params[SerializationKeys.searchQuery] = searchBarView.searchBar.text!
        params[SerializationKeys.perPage] = APIConstant.Data.limit
        params[SerializationKeys.page] = pageNumber
        return params
    }
    
    func handleSearchedUsersResponse(_ users: SearchedUsers?) {
        if let users = users {
            searchedUsersList.append(contentsOf: users.items)
            showingLabel.text = "result(s)".precedingZeroShowing(searchedUsersList.count)
            
            let totalRecordsOnServer = users.totalCount
            if totalRecordsOnServer > searchedUsersList.count {
                pageNumber = pageNumber + 1
                isAllRecordsFetched = false
            } else {
                isAllRecordsFetched = true
            }
        }
        showViews()
        tableView.reloadData()
    }
    
}

//MARK:- UITableViewDataSource & UITableViewDelegate

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
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
    
    //For Pagination
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            guard let strongSelf = self else { return }
            if tableView.visibleCells.contains(cell) {
                // load more data
                if !strongSelf.isPaginationListLoading {
                    if indexPath.row == (strongSelf.searchedUsersList.count) - 1 {
                        if !strongSelf.isAllRecordsFetched {
                            if Reachability.isConnectedToNetwork() {
                                strongSelf.showPaginationLoader()
                                strongSelf.searchUser(false)
                            }
                        }
                    }
                }
            }
        }
    }
    
}

// MARK: - SearchBarViewDelegate

extension SearchViewController: SearchBarViewDelegate {
    
    func searchBarView(_ searchBar: TopSearchBar, textDidChange text: String) { }
    
    func didSearchBarDidBeginEditing(_ searchBar: TopSearchBar) {
        searchedUsersList.removeAll()
        setupInitialPage()
        hideViews()
    }
    
    func didCancelButtonTapped() {
        hideSearchBarView(withoutAnimation: false)
    }
    
    func didKeyboardSearchTapped(_ searchBar: TopSearchBar) {
        searchBar.resignFirstResponder()
        searchedUsersList.removeAll()
        searchUser(true)
    }
    
}
