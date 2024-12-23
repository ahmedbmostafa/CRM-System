//
//  UserDetailsModel.swift
//  CRMSystem
//
//  Created by Ahmed beddah on 23/12/2024.
//

import Foundation

// MARK: - UserDetailsModel

struct UserDetailsModel: Codable, Identifiable {
    let id: Int
    let name, email: String
    let address: AddressModel
    let phone, website: String
    let company: CompanyModel
}

// MARK: - AddressModel

struct AddressModel: Codable {
    let street, city: String
}

// MARK: - CompanyModel

struct CompanyModel: Codable {
    let name: String
}
