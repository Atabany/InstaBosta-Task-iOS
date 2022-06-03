//
//  AlbumPhotosGridViewModel.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 04/06/2022.
//

import Foundation
import RxSwift
import RxRelay
import RxDataSources

class AlbumPhotosGridViewModel {
    
    // MARK: - Repos


    // MARK: - Global Variables
    var album: AlbumResponse
    var allAlbumPhotos: BehaviorRelay<[Photo]> = BehaviorRelay<[Photo]>(value: [])
    var collectionViewAlbumPhotos: BehaviorRelay<[Photo]> = BehaviorRelay<[Photo]>(value: [])
    var collectionViewSections: BehaviorRelay<[AlbumPhotosGridSection]> = BehaviorRelay<[AlbumPhotosGridSection]>(value: [])
    let title: PublishSubject<String> = PublishSubject<String>()
    let disposeBag = DisposeBag()
    
    
    // MARK: - Initialization
    init(album: AlbumResponse) {
        self.album = album
        title.onNext(album.title ?? "")
        rxBinding()
    }
    
    
    
    // MARK: - Binding
    private func rxBinding() {
        bindAlbumRepo()
        bindSections()
    }
    
    private func bindAlbumRepo() {
        allAlbumPhotos.subscribe(onNext: {[unowned self] allAlbumPhotos in
            self.collectionViewAlbumPhotos.accept(allAlbumPhotos)
        }).disposed(by: disposeBag)
    }
    
    private func bindSections() {
        collectionViewAlbumPhotos.subscribe(onNext: { [unowned self] albumPhotos in
            self.createCollectionViewSections(albumPhotos: albumPhotos)
        }).disposed(by: disposeBag)
    }
    
    
    // MARK: - Fetch data
    private func fetchData() {
        
        
    }

    
    
    // MARK: -  data Source
    private func createCollectionViewSections(albumPhotos: [Photo]) {
        let sections = [
            AlbumPhotosGridSection(header: "Photos", items: albumPhotos)
        ]
        collectionViewSections.accept(sections)
    }
    
    

}


extension AlbumPhotosGridViewModel {
    
}
