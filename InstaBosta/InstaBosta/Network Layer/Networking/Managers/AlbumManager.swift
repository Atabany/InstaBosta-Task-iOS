//
//  AlbumManager.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 04/06/2022.
//

import Foundation
import RxSwift

protocol AlbumPhotosManageable: AnyObject {
    var photos: PublishSubject<[Photo]?> { get set }
    func fetchAlbumPhotos(albumId: Int)
}


class AlbumPhotosWebServiceManager: AlbumPhotosManageable {
    
    var photos: PublishSubject<[Photo]?> = PublishSubject<[Photo]?>()
    
    private var disposeBag = DisposeBag()
    
    var api: BaseAPI = BaseAPI()
    func fetchAlbumPhotos(albumId: Int) {
        let photosRequest = PhotosAPI.getAlbumPhotos(albumId: albumId)
        api.fetchData(request: photosRequest, responseObservable: photos)
    }
}
