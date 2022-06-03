//
//  ProfileManager.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 01/06/2022.

import Foundation
import RxSwift
protocol ProfileManageable: AnyObject {
    var users: PublishSubject<[UserResponse]?> { get set }
    var user: PublishSubject<UserResponse?> { get set }
    
    var albums: PublishSubject<[AlbumResponse]?> { get set }

    func fetchUsers()
    func fetchAlbums(userID: Int)
}


class ProfileWebServiceManager: ProfileManageable {
    
    var albums: PublishSubject<[AlbumResponse]?> = PublishSubject<[AlbumResponse]?>()
    
        
    var users: PublishSubject<[UserResponse]?> = PublishSubject<[UserResponse]?>()
    var user: PublishSubject<UserResponse?> = PublishSubject<UserResponse?>()

    
    private var disposeBag = DisposeBag()
    
    var api: BaseAPI = BaseAPI()
    
    func fetchUsers() {
        let allUsersRequest = UserAPI.getAllUsers
        api.fetchData(request: allUsersRequest, responseObservable: users)
        users.subscribe(onNext: { [unowned self]  users in
            guard let users = users else {return}
            self.user.onNext(users.randomElement())
        })
        .disposed(by:  disposeBag)
    }
    
    func fetchAlbums(userID: Int) {
        let userAlbumsRequest = AlbumAPI.getAlbums(userId: userID)
        api.fetchData(request: userAlbumsRequest, responseObservable: albums )
    }
    
        
}
