//
//  String.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 07/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import Foundation

extension String {
    
    //Navigation bar Titles
    static let home = "Home"
    
    //Button Titles
    static let viewDetails = "View Details"
    static let sortBy = "Sort by"
    static let cancel = "Cancel"
    
    //Others
    static let loading = "Loading"
    
}

extension String {
    
    func precedingZeroShowing(_ count: Int) -> String {
        return String(format: "Showing %02d \(self)", count)
    }
    
}
