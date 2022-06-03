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
            configureCell: { sectionsData, collectionView, indexPath, albumPhoto in
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionCell.reuseId, for: indexPath) as? PhotoCollectionCell else {return UICollectionViewCell()}
                cell.photoImageView.setImage(from: albumPhoto.thumbnailURL)
                return cell
            })
    }
    
    
    
}


