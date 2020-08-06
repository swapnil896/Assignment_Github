//
//  UsersAPI.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 06/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import Foundation

enum UsersAPI {
    case users([String: Any])
}

extension UsersAPI: Endpoint {
    
    var baseURL: URL {
        return BackendConfiguration.serviceRoot
    }
    
    var path: String {
        switch self {
        case .users:
            return APIConstant.Endpoint.users
        }
    }
    
    var method: String {
        switch self {
        case .users:
            return BackendConfiguration.httpMethod(.get)
        }
    }
    
    var queryType: QueryType {
        switch self {
        case .users:
            return .queryString
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .users(let params):
            return params
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .users:
            return nil
        }
    }
    
}
