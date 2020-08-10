//
//  UsersAPI.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 06/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import Foundation

enum UsersAPI {
    case users
    case searchUser([String: Any])
}

extension UsersAPI: Endpoint {
    
    var baseURL: URL {
        return BackendConfiguration.serviceRoot
    }
    
    var path: String {
        switch self {
        case .users:
            return APIConstant.Endpoint.users
        case .searchUser:
            return APIConstant.Endpoint.searchUsers
        }
    }
    
    var method: String {
        switch self {
        case .users, .searchUser:
            return BackendConfiguration.httpMethod(.get)
        }
    }
    
    var queryType: QueryType {
        switch self {
        case .users:
            return .httpBody
        case .searchUser:
            return .queryString
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .users:
            return nil
        case .searchUser(let params):
            return params
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .users, .searchUser:
            return nil
        }
    }
    
}
