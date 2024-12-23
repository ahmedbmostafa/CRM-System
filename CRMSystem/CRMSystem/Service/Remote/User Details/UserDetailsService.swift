//
//  UserDetailsService.swift
//  CRMSystem
//
//  Created by Ahmed beddah on 23/12/2024.
//

import Foundation
import Combine

protocol UserDetailsServiceable {
    func getUserDetails() -> AnyPublisher<[UserDetailsModel], APIError>
}

class UserDetailsService: UserDetailsServiceable {
    
    // MARK: - Properties
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService = NetworkManager()) {
        self.networkService = networkService
    }
    
    func getUserDetails() -> AnyPublisher<[UserDetailsModel], APIError> {
        let endpoint = UserDetailsEndpoint.getUserDetails
        let request = endpoint.createRequest(parameters: nil)
        return networkService.request(request, decodingType: [UserDetailsModel].self)
    }
}
