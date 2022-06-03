//
//  ProfileViewModel.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 01/06/2022.
//

import Foundation
import RxSwift
import RxRelay
import RxDataSources



class ProfileViewModel {
    
    
    
    // MARK: -  Variables
    var user: BehaviorRelay<UserResponse?> = BehaviorRelay<UserResponse?>(value: nil)
    var albums: BehaviorRelay<[AlbumResponse]> = BehaviorRelay<[AlbumResponse]>(value: [])
    var tableViewSections: BehaviorRelay<[ProfileSection]> = BehaviorRelay<[ProfileSection]>(value: [])
    let disposeBag = DisposeBag()
    
    var profileManager: ProfileManageable!
    
    // MARK: - Life Cycle
    init(profileManager: ProfileManageable) {
        self.profileManager = profileManager
        binding()
        profileManager.fetchUsers()
    }
    
    // MARK: - Binding
    private func binding() {
        bindingUser()
    }
    
    
    private func bindingUser() {
                
        profileManager.user.bind(to: user).disposed(by: disposeBag)
        user.subscribe(onNext: { [unowned self] user in
            // get the albums of the selected user
            guard let user = user else {return}
            print(user.name)
        }).disposed(by: disposeBag)
    }
    
}
