//
//  UserViewModel.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 08/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import Foundation

class UserViewModel {
    
    //MARK:- Singleton
    
    static let shared = UserViewModel()
    
    //MARK:- Initialization
    
    private init() { }
    private var networking = Networking()
    
}

//MARK:- Public

extension UserViewModel {
    
    func getGithubUsers(onSuccess success: @escaping (Users) -> Void, onFailure failure: @escaping (_ error: Error) -> Void) {
        networking.performNetworkTask(endPoint: UsersAPI.users, type: [User].self) { (response, error) in
            if let error = error {
                failure(error)
            } else if let resp = response {
                success(resp)
            }
        }
    }
    
    func searchUsers(_ searchParam: String , onSuccess success: @escaping (SearchedUsers) -> Void, onFailure failure: @escaping (_ error: Error) -> Void) {
        networking.performNetworkTask(endPoint: UsersAPI.searchUser(searchParam), type: SearchedUsers.self) { (response, error) in
            if let error = error {
                failure(error)
            } else if let resp = response {
                success(resp)
            }
        }
    }
    
}

