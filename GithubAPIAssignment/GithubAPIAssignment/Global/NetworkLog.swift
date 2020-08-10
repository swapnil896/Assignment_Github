//
//  NetworkLog.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 09/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import Foundation

func NetworkLog<T>(_ object: @autoclosure () -> T) {
    #if DEBUG
        print(String(reflecting: object()) + "\n")
    #endif
}
