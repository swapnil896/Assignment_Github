//
//  ViewController.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 06/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    //MARK:- VC Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        hideNavigationBar()
        hideBackButton()
    }
    
    //MARK:- Override
    
    func isHideNavigationBar() -> Bool {
        return false
    }
    
    func isHideBackButton() -> Bool {
        return false
    }

}

//MARK:- Private

private extension BaseViewController {
    
    func hideNavigationBar() {
        navigationController?.navigationBar.isHidden = isHideNavigationBar()
    }
    
    func hideBackButton() {
        navigationItem.hidesBackButton = isHideBackButton()
    }
    
}

