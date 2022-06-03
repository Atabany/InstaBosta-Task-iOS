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
        fetchProfileData()
    }
    
    // MARK: - Binding
    private func binding() {
        // - BIND USER
        bindUser()
        // - BIND Albums
        bindAlbums()
    }
    
    private func bindUser() {
        profileManager.user.bind(to: user).disposed(by: disposeBag)
        user.subscribe(onNext: { [unowned self] user in
            // get the albums of the selected user
            profileManager.fetchAlbums(userID: user?.id ?? 0)
        }).disposed(by: disposeBag)

    }
    

    private func bindAlbums() {
        profileManager.albums.subscribe(onNext: { [unowned self] returnedAlbums in
            self.albums.accept(returnedAlbums ?? [])
            print(returnedAlbums)
        }).disposed(by: disposeBag)
    }
    

    private func fetchProfileData() {
        profileManager.fetchUsers()
    }
    
}
