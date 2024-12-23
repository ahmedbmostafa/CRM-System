//
//  UserDetailsEndpoint.swift
//  CRMSystem
//
//  Created by Ahmed beddah on 23/12/2024.
//

import Foundation

enum UserDetailsEndpoint {
    
    // MARK: - Cases
    
    case getUserDetails
    
    // MARK: - Properties
    
    var baseURL: String {
        switch self {
        default:
            return valueOfSecret(named: "BaseURL")
        }
    }
    
    var path: String {
        switch self {
        case .getUserDetails:
            return "/users"
        }
    }
    
    var httpMethod: HttpMethod {
        switch self {
        case .getUserDetails:
            return .get
        }
    }
    
    // MARK: - Request
    
    func createRequest(parameters: [String: Any]?) -> URLRequest {
        let pathURL = URL(string: self.baseURL + self.path)!
        print("pathURL=",pathURL)
        var urlRequest = URLRequest(url: pathURL)
        urlRequest.httpMethod = self.httpMethod.rawValue
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        if urlRequest.httpMethod != "GET" {
            if let parameters = parameters {
                urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: parameters , options: .fragmentsAllowed)
            }
        }
        return urlRequest
    }
}
