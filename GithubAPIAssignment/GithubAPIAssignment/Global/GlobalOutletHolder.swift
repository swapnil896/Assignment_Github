//
//  GlobalOutletHolder.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 10/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import Foundation

class GlobalOutletHolder {
    
    // MARK: - Singleton
    
    static let shared = GlobalOutletHolder()
    
    // MARK: Initialization
    
    private init() {
    }
    
    // MARK: - Public Properties
    
    var messageBanner: MessageBannerView = MessageBannerView()
    //var dropdownPicker: DropdownPickerView = DropdownPickerView()
    
}
