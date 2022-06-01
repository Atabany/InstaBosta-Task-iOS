//
//  Profile.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 01/06/2022.
//

import Foundation

// MARK: - User
struct UserResponse: Codable {
    let id: Int?
    let name: String?
    let userName: String?
    let address: Address?
    
    enum codingKey: String, CodingKey {
        case id, name, address
        case userName = "username"
    }
}


