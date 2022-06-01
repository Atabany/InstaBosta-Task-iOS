//
//  BaseParamaters.swift
//  Marvel
//
//  Created by Mohamed Elatabany on 30/05/2022.
//

import Foundation


protocol BaseParamatersProtocol: Codable {}


extension BaseParamatersProtocol {

    
    var defaultParams: [String: Any] {
        return [:]
    }
}



