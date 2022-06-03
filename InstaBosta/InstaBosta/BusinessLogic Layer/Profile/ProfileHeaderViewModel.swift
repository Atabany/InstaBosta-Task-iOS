//
//  UserViewModel.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 01/06/2022.
//

import Foundation

struct ProfileHeaderViewModel {

    var user: UserResponse!
    
    init(user: UserResponse) {
        self.user = user
    }
    
    
    var name: String {
        user.name ?? "Guest"
    }

    
    var id: Int {
        user.id ?? 0
    }
    
    var address: String {
        return [user.address?.street ?? "", user.address?.suite ?? "", user.address?.city ?? "", user.address?.zipcode ?? ""].joined(separator: ", ")
    }
    
}


