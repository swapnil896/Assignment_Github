//
//  BackendConfiguration.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 06/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import Foundation

//MARK:- Enums

enum BackendPointing: Int {
    case development, uat, production
}

enum QueryType {
    case queryString, httpBody, none
}

enum HTTPMethod {
    case get, post, delete, put, none
}

class BackendConfiguration {
    
    //MARK:- Private Properties
    
    private static let configuration = BackendConfiguration()
    private var configurationDict: NSDictionary!
    
    //MARK:- Initialization
    
    private init() {
        
    }
    
}

//MARK:- Public

extension BackendConfiguration {
    
    static var backendPointing: BackendPointing = .development
    
    static var serviceRoot: URL {
        let serviceRoot = configuration.configurationDict.value(forKeyPath: ConfigKey.host) as! String
        return URL(string: serviceRoot)!
    }
    
    static var timeout: Double {
        return Double(configuration.configurationDict.value(forKey: ConfigKey.timeout) as! String)!
    }
    
    static func httpMethod(_ method: HTTPMethod) -> String {
        switch method {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .delete:
            return "DELETE"
        case .put:
            return "PUT"
        case .none:
            return ""
        }
    }
    
}

//MARK:- Private

private extension BackendConfiguration {
    
    func readConfigurationPlist() {
        var pointedTo = ConfigKey.development
        switch BackendConfiguration.backendPointing {
        case .development:
            pointedTo = ConfigKey.development
        case .uat:
            pointedTo = ConfigKey.uat
        case .production:
            pointedTo = ConfigKey.producation
        }
        if let mobileServiceDict = ConfigReader.read(file: File.backendConfiguration, fileType: FileType.plist), let dict = mobileServiceDict[pointedTo] as? NSDictionary {
            configurationDict = dict
        }
    }
    
}
