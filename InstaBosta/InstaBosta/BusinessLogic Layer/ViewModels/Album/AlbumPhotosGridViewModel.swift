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
    var allPhotos: BehaviorRelay<[Photo]> = BehaviorRelay<[Photo]>(value: [])
    var collectionViewAlbumPhotos: BehaviorRelay<[Photo]> = BehaviorRelay<[Photo]>(value: [])
    var collectionViewSections: BehaviorRelay<[AlbumPhotosGridSection]> = BehaviorRelay<[AlbumPhotosGridSection]>(value: [])
    let title: BehaviorSubject<String> = BehaviorSubject<String>(value: "")
    let disposeBag = DisposeBag()
    let photosService: AlbumPhotosManageable
    
    // MARK: - Initialization
    init(album: AlbumResponse, photosService: AlbumPhotosManageable) {
        self.album = album
        self.photosService = photosService
        title.onNext(album.title ?? "")
        bindings()
        fetchData()
    }
    
    
    
    // MARK: - Binding
    private func bindings() {
        bindAlbumPhotos()
        bindSections()
    }
    
    private func bindAlbumPhotos() {
        photosService.photos.subscribe(onNext: { [unowned self] photos in
            self.allPhotos.accept(photos ?? [])
        }).disposed(by: disposeBag)
        
        allPhotos.subscribe(onNext: {[unowned self] allAlbumPhotos in
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
        photosService.fetchAlbumPhotos(albumId: album.id ?? 0)
    }

    
    
    // MARK: -  data Source
    private func createCollectionViewSections(albumPhotos: [Photo]) {
        let sections = [
            AlbumPhotosGridSection(header: "Photos", items: albumPhotos)
        ]
        collectionViewSections.accept(sections)
    }
    
    
    // MARK: - Search
    
    func search(with text: String) {
        let selectedFilteredPhotos = allPhotos.value.filter { $0.title.lowercased()
            .contains(text.lowercased()) }
        self.collectionViewAlbumPhotos.accept((text == "")  ? allPhotos.value :   selectedFilteredPhotos)
    }


    
    

}


