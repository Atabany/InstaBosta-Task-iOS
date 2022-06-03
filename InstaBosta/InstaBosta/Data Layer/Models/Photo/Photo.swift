//
//  Photo.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 04/06/2022.
//

import Foundation


class Photo: Codable {
    
    let id: Int
    let albumId: Int
    let title: String
    let url: String
    let thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case id, title, url
        case albumId = "albumId"
        case thumbnailURL = "thumbnailUrl"
    }

}
