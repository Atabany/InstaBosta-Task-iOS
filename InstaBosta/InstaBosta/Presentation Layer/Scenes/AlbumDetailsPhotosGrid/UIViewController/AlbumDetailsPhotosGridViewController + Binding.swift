//
//  AlbumDetailsPhotosGridViewController + Binding.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 04/06/2022.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay
import RxDataSources


extension AlbumDetailsPhotosGridViewController: UICollectionViewDelegate {
    
    
    func binding() {
        bindTitle()
        bindCollectionView()
        bindSearchBar()
        bindSelection()
    }
    
    
    private func bindSearchBar() {
        searchController.searchBar.rx.text
            .orEmpty
            .debounce(.milliseconds(500), scheduler: MainScheduler.instance) // Wait 0.5 for changes.
            .subscribe(onNext: {[unowned self] value in
                self.viewModel.search(with: value)
            }).disposed(by: disposeBag)
    }
    
    
    
    private func bindTitle() {
        viewModel.title
            .subscribe { [unowned self] title in
                self.title = title
            }.disposed(by: disposeBag)
        
    }
    
    
    private func bindCollectionView() {
        collectionView.register(PhotoCollectionCell.self, forCellWithReuseIdentifier: PhotoCollectionCell.reuseId)
        collectionView.rx.setDelegate(self).disposed(by: disposeBag)
        setCollectionViewDataSource()
        guard let photoGridDataSource = photoGridDataSource else {return}
        viewModel.collectionViewSections.bind(to: collectionView.rx.items(dataSource: photoGridDataSource))
            .disposed(by: disposeBag)
        
        
    }
    
    
    
    // MARK: - Private Methods
    private func setCollectionViewDataSource() {
        photoGridDataSource = RxCollectionViewSectionedReloadDataSource<AlbumPhotosGridSection>(
            configureCell: { sectionsData, collectionView, indexPath, photo in
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionCell.reuseId, for: indexPath) as? PhotoCollectionCell else {return UICollectionViewCell()}
                cell.photoImageView.setImage(from: photo.thumbnailURL)
                return cell
            })
    }
    
    
    // MARK: - Selection
    
    private func bindSelection() {
        guard let photoGridDataSource = photoGridDataSource else {return}
        
        collectionView.rx.itemSelected.subscribe(onNext: {[weak self] indexPath in
            let selectedItem = photoGridDataSource[indexPath]
            self?.coordinator.goToDetails(imageURL: selectedItem.thumbnailURL )
        }).disposed(by: self.disposeBag)
        
    }
    
    
    
    
}


