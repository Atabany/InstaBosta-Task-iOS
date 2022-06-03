//
//  PhotosAPI.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 04/06/2022.
//

import Foundation

import Moya

enum PhotosAPI {
    case getAlbumPhotos(albumId: Int)
}

extension PhotosAPI: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string:  Config.apiURL) else {
            fatalError("❌ INVALID URL")
        }
        return url
    }

    var path: String {
        switch self {
        case .getAlbumPhotos:
            return "/photos"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAlbumPhotos:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getAlbumPhotos(let albumId):
            return .requestParameters(parameters: ["albumId": albumId], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }

    var responseFileName: String {
        switch self {
        case .getAlbumPhotos:
            return "album_photos_response"
        }
    }
}
