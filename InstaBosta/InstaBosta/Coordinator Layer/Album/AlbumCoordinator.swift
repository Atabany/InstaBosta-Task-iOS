//
//  AlbumCoordinator.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 04/06/2022.
//

import UIKit

class AlbumCoordinator: Coordinator {
    
    var rootViewController: UIViewController
    

    
    
    init(vc: UIViewController) {
        rootViewController = vc
    }
    
    
    func start() {}
    
    
    func goToDetails(imageURL: String?) {
        let zoomVC = PhotoDetialsVC(imageURL: imageURL ?? "")
        rootViewController.present(zoomVC, animated: true, completion: nil)
    }
    
}
