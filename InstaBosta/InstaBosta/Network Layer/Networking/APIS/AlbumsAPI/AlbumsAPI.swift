//
//  AlbumsAPI.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 03/06/2022.
//

import Foundation
import Moya



enum AlbumAPI {
    case getAlbums(userId: Int)
}


extension AlbumAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string:  Config.apiURL) else {
            fatalError("❌ INVALID URL")
        }
        return url
    }

    var path: String {
        switch self {
        case .getAlbums:
            return "/albums"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAlbums:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getAlbums(let userId):
            return .requestParameters(parameters: ["userId": userId], encoding: URLEncoding.default)
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
        case .getAlbums:
            return "album_response"
        }
    }
}
