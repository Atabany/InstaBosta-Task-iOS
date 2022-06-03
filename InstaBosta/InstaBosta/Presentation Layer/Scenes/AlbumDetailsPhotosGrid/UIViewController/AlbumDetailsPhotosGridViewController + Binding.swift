//
//  AlbumDetailsPhotosGridViewController + Binding.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 04/06/2022.
//

import Foundation
extension AlbumDetailsPhotosGridViewController {
    
    
    func binding() {
        title = "Hello"
        viewModel.title
            .subscribe { [unowned self] title in
                self.title = title
            }.disposed(by: disposeBag)
        
    }

    
}

