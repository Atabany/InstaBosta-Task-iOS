//
//  AlbumRowViewModel.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 01/06/2022.
//

import Foundation

struct AlbumItemViewModel {
    var album: AlbumResponse!
    
    init(album: AlbumResponse) {
        self.album = album
    }
}


extension AlbumItemViewModel {
    
    var title: String {
        return album.title ?? ""
    }
    
}
