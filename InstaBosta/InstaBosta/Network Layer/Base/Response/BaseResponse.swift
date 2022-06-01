//
//  BaseResponse.swift
//  NetworkLayer
//
//  InstaBosta
//
//  Created by Mohamed Elatabany on 01/06/2022.

import Foundation

class BaseResponse<T: Codable>: Codable {
    var status: String?
    var data: T?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
    }
}




