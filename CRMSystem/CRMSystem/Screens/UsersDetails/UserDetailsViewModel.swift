//
//  UserDetailsViewModel.swift
//  CRMSystem
//
//  Created by Ahmed beddah on 23/12/2024.
//

import Combine

class UserDetailsViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var users: [UserDetailsModel] = []
    private let userDetailsService: UserDetailsServiceable
    private var cancellables = Set<AnyCancellable>()
    
    init(userDetailsService: UserDetailsServiceable = UserDetailsService()) {
        self.userDetailsService = userDetailsService
    }
    
    func onAppear() {
        getUserDetails()
    }
}

extension UserDetailsViewModel {
    private func getUserDetails() {
        let response: AnyPublisher<[UserDetailsModel], APIError> = userDetailsService.getUserDetails()
        response
            .sink(receiveCompletion: onReceiveFailure, receiveValue: onReceiveUserDetailsResponse)
            .store(in: &cancellables)
    }
    
    private func onReceiveFailure(_ completion: Subscribers.Completion<APIError>) {
        if case let .failure(error) = completion {
            print("err=",error)
        }
    }
    
    private func onReceiveUserDetailsResponse(_ response: [UserDetailsModel]) {
        let data = response
        users = data
    }
}
