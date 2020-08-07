//
//  UIFont.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 08/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import UIKit

extension UIFont {
    
    // MARK: - Public

      class func systemThin(_ fontSize: CGFloat) -> UIFont {
          return UIFont.systemFont(ofSize: fontSize, weight: .thin)
      }
      
      class func systemLight(_ fontSize: CGFloat) -> UIFont {
          return UIFont.systemFont(ofSize: fontSize, weight: .light)
      }
      
      class func system(_ fontSize: CGFloat) -> UIFont {
          return UIFont.systemFont(ofSize: fontSize, weight: .regular)
      }
      
      class func systemMedium(_ fontSize: CGFloat) -> UIFont {
          return UIFont.systemFont(ofSize: fontSize, weight: .medium)
      }
      
      class func systemSemibold(_ fontSize: CGFloat) -> UIFont {
          return UIFont.systemFont(ofSize: fontSize, weight: .semibold)
      }
      
      class func systemBold(_ fontSize: CGFloat) -> UIFont {
          return UIFont.systemFont(ofSize: fontSize, weight: .bold)
      }
      
      class func systemItalic(_ fontSize: CGFloat) -> UIFont {
          return UIFont.italicSystemFont(ofSize: fontSize)
      }
    
}
