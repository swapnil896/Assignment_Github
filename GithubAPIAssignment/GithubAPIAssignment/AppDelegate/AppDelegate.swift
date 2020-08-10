//
//  AppDelegate.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 06/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupModules()
        return true
    }

}

//MARK:- Private

private extension AppDelegate {
    
    func setupModules() {
        customizeStatusBar()
        configureBackend()
    }
    
    func configureBackend() {
        BackendConfiguration.backendPointing = .development
    }
    
    func customizeStatusBar() {
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
}
