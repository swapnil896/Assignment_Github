//
//  Response.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 06/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import Foundation

struct Response {
    
    // MARK: - Private Properties
    
    fileprivate var data: Data
    
    // MARK: - Initialization
    
    init(data: Data) {
        self.data = data
    }
    
}

// MARK: - Public

extension Response {
    
    public func decode<T: Codable>(_ type: T.Type) -> T? {
        let jsonDecoder = JSONDecoder()
        do {
            let response = try jsonDecoder.decode(T.self, from: data)
            return response
        } catch {
            return nil
        }
    }
    
}
