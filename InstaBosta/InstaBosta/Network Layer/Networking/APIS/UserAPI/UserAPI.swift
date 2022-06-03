//
//  UserAPI.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 03/06/2022.
//

import Foundation
import Moya

enum UserAPI {
    case getAllUsers
}

extension UserAPI: TargetType {
    var task: Task {
        switch self {
        case .getAllUsers:
            return .requestPlain
        }
    }
    
    
    var baseURL: URL {
        guard let url = URL(string:  Config.apiURL) else {
            fatalError("❌ INVALID URL")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .getAllUsers:
            return "/users"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAllUsers:
            return .get
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
        case .getAllUsers:
            return "users_response"
        }
    }
}

