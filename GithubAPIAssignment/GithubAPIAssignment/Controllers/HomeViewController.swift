//
//  HomeViewController.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 06/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    //MARK:- VC Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        if Reachability.isConnectedToNetwork() {
            print("Connected")
        } else {
            print("Not connected")
        }
    }

}

//MARK:- Private

private extension HomeViewController {
    
    
}


