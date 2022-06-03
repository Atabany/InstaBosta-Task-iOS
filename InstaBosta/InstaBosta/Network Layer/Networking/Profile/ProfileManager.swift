//
//  ProfileManager.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 01/06/2022.

import Foundation

protocol ProfileManageable: AnyObject {
    func fetchProfile(completion: @escaping (Result<ProfileViewModel, NSError>) -> Void)
}


class ProfileManager: ProfileManageable {
    func fetchProfile(completion: @escaping (Result<ProfileViewModel, NSError>) -> Void) {

        
        
        
    }
}
