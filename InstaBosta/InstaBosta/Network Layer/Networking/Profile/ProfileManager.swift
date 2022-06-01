//
//  ProfileManager.swift
//  Banky
//
//  Created by Mohamed Elatabany on 20/03/2022.
//

import Foundation

protocol ProfileManageable: AnyObject {
    func fetchProfile(completion: @escaping (Result<ProfileViewModel, NSError>) -> Void)
}



class ProfileManager: ProfileManageable {
    
    func fetchProfile(completion: @escaping (Result<ProfileViewModel, NSError>) -> Void) {


    }
    

}
