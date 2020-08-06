//
//  UIStoryboard.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 06/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import UIKit

private struct FileConstant {
    static let main = "Main"
}

class Storyboard {
    
    static let controller = ViewController()
    
}

extension Storyboard {
    
    class ViewController {
        
        //MARK:- Storyboard Instances
        
        private let mainStoryboard = UIStoryboard(name: FileConstant.main, bundle: nil)
        
        //MARK:- Main Storyboard View Controllers
        
        func home() -> HomeViewController {
            return (mainStoryboard.instantiateViewController(withIdentifier: HomeViewController.className) as? HomeViewController)!
        }
        
    }
    
}
