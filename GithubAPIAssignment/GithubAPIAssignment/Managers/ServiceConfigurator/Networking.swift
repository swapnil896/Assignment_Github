//
//  Networking.swift
//  GithubAPIAssignment
//
//  Created by Swapnil  Magar on 06/08/20.
//  Copyright © 2020 Swapnil Magar. All rights reserved.
//

import Foundation

struct Networking {
    
    func performNetworkTask<T: Codable>(endPoint: Endpoint, type: T.Type, completion: ((_ response: T?, _ error: Error?) -> Void)?) {
        guard let urlRequest = urlRequest(endPoint) else { return }
        let urlSession = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
            NetworkLog(urlRequest)
            if let error = error {
                completion?(nil, error)
            }
            guard let data = data else {
                completion?(nil, self.apiFailedError)
                return
            }
            let response = Response(data: data)
            guard let decoded = response.decode(type) else {
                return
            }
            NetworkLog(decoded)
            completion?(decoded, nil)
        }
        urlSession.resume()
    }
    
}

//MARK:- Private

private extension Networking {
    
    func urlRequest(_ endpoint: Endpoint) -> URLRequest? {
        if let urlString = endpoint.baseURL.appendingPathComponent(endpoint.path).absoluteString.removingPercentEncoding {
            let url = URL(string: urlString)
            var request: URLRequest?
            if let url = url {
                switch endpoint.queryType {
                case .httpBody:
                    request = URLRequest(url: url)
                    if let params = endpoint.parameters, !params.isEmpty {
                        request?.httpBody = try! JSONSerialization.data(withJSONObject: params, options: [])
                    }
                case .queryString:
                    if let params = endpoint.parameters, !params.isEmpty {
                        var query = ""
                        params.forEach { key, value in
                            query += "\(key)=\(value)&"
                        }
                        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
                        components.query = query
                        request = URLRequest(url: components.url!)
                    }
                case .none:
                    request = URLRequest(url: url)
                }
                request?.timeoutInterval = BackendConfiguration.timeout
            }
            return request
        }
        return nil
    }
    
    var apiFailedError: Error {
        let userInfo: [String : Any] = [
                NSLocalizedDescriptionKey :  NSLocalizedString("Failed", value: "Something went wrong.", comment: "") ,
                NSLocalizedFailureReasonErrorKey : NSLocalizedString("Failed", value: "Something went wrong.", comment: "") ]
        let err = NSError(domain: "ErrorDomain", code: 401, userInfo: userInfo)
        return err
        
    }
    
}
