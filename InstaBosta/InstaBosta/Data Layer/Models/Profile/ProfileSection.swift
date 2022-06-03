//
//  ProfileSection.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 03/06/2022.
//

import Foundation
import RxDataSources

struct ProfileSection {
    var header: String
    var items: [Item]
}

extension ProfileSection: SectionModelType {
    typealias Item = AlbumResponse
    
    init(original: ProfileSection, items: [Item]) {
        self = original
        self.items = items
    }
}
