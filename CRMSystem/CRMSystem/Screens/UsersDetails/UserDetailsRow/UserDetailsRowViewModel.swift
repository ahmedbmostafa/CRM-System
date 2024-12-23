//
//  UserDetailsRowViewModel.swift
//  CRMSystem
//
//  Created by Ahmed beddah on 23/12/2024.
//

import Foundation

class UserDetailsRowViewModel: ObservableObject {
    
    // MARK: - Properties
    
    private let user: UserDetailsModel
    @Published var isLiked: Bool
    
    init(user: UserDetailsModel) {
        self.user = user
        self.isLiked = UserDefaults.standard.bool(forKey: "\(user.id)")
    }
    
    func cacheLikedState(isLiked: Bool, userID: Int) {
        UserDefaults.standard.set(isLiked, forKey: "\(userID)")
        self.isLiked = UserDefaults.standard.bool(forKey: "\(userID)")
    }
}

extension UserDetailsRowViewModel {
    var userID: Int {
        user.id
    }
    
    var name: String {
        user.name
    }
    
    var email: String {
        user.email
    }
    
    var phone: String {
        user.phone
    }
    
    var companyName: String {
        user.company.name
    }
    
    var address: String {
        "\(user.address.street), \(user.address.city)"
    }
}
