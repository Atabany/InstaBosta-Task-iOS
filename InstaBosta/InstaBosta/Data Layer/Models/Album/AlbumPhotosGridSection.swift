//
//  PhotosGridSection.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 04/06/2022.
//

import Foundation
import RxDataSources

struct AlbumPhotosGridSection {
    var header: String
    var items: [Item]
}

extension AlbumPhotosGridSection: SectionModelType {
    typealias Item = Photo
    
    init(original: AlbumPhotosGridSection, items: [Item]) {
        self = original
        self.items = items
    }
}
