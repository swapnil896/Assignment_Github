//
//  APIConstant.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 06/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import Foundation

enum APIConstant {
    
    enum Endpoint {
        static let users = "users?since=1"
        static let searchUsers = "search/users?"
    }
    
    enum Data {
        static let limit = 15
    }
    
}
