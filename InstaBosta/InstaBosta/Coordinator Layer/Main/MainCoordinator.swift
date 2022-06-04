//
//  MainCoordinator.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 04/06/2022.
//

import UIKit

class MainCoordinator: Coordinator {
    
    
    var rootViewController: UINavigationController

    var childCoordinators = [Coordinator]()
    
    
    init() {
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
    }
    
    
    func start() {
        let profileCoordinator = ProfileCoordinator()
        profileCoordinator.start()
        childCoordinators.append(profileCoordinator)
        rootViewController.viewControllers = [profileCoordinator.rootViewController]
    }
    
    
    
}
