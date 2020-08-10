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
    case searchUser(String)
}

extension UsersAPI: Endpoint {
    
    var baseURL: URL {
        return BackendConfiguration.serviceRoot
    }
    
    var path: String {
        switch self {
        case .users:
            return APIConstant.Endpoint.users
        case .searchUser(let searchParam):
            return APIConstant.Endpoint.searchUsers + searchParam
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
        case .users, .searchUser:
            return .httpBody
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .users, .searchUser:
            return nil
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .users, .searchUser:
            return nil
        }
    }
    
}
