//
//  ConfigReader.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 06/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import Foundation

class ConfigReader { }

//MARK:- Public

extension ConfigReader {
    
    static func read(file name: String, fileType type: String) -> NSDictionary? {
        if let path = Bundle.main.path(forResource: name, ofType: type) {
            return NSDictionary(contentsOfFile: path)
        }
        return nil
    }
    
}
