//
//  UIColor.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 07/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import UIKit

extension UIColor {
    
    class var navigationBar: UIColor {
        return color(withRed: 61, green: 88, blue: 166)
    }
    
    class var black40: UIColor {
        return color(withRed: 41, green: 40, blue: 40)
    }
    
    class var blackt60: UIColor {
        return color(withRed: 61, green: 60, blue: 60)
    }
    
}

//MARK:- Private

private extension UIColor {
    
    static func color(withRed red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
   
}
