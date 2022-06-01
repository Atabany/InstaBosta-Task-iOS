//
//  BaseParamaters.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 01/06/2022.
//

import Foundation


protocol BaseParamatersProtocol: Codable {}


extension BaseParamatersProtocol {

    
    var defaultParams: [String: Any] {
        return [:]
    }
}



