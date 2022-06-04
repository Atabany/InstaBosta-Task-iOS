//
//  ApplicationCoordinator.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 04/06/2022.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    
    var window: UIWindow
    
    var childCoordniators = [Coordinator]()
    
    
    
    init(window: UIWindow) {
        self.window = window
    }
    
    
    func start() {
        let mainCoordinator = MainCoordinator()
        mainCoordinator.start()
        childCoordniators = [mainCoordinator]
        window.rootViewController = mainCoordinator.rootViewController
    }
    
    
    
        
    
    
    
    
    
    
}
