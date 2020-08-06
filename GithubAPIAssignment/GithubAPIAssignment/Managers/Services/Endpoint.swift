//
//  Endpoint.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 06/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import Foundation

protocol Endpoint {
    
    // MARK: - Public Properties
    
    var baseURL: URL { get }
    var path: String { get }
    var method: String { get }
    var queryType: QueryType { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
    
}

