//
//  ProfileCoordinator.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 04/06/2022.
//

import Foundation
import UIKit
import SwiftUI


class ProfileCoordinator: Coordinator {
    
    var rootViewController: UIViewController
    
    
    var profileViewModel: ProfileViewModel = ProfileViewModel(profileManager: ProfileWebServiceManager())
    
    
    init() {
        rootViewController = UIViewController()
    }
    

    
    
    
    lazy var profileViewController: ProfileViewController = {
        let vc = ProfileViewController(viewModel: profileViewModel)
        vc.showDetailsRequested = { [weak self]  album in
            self?.goToDetails(album: album)
        }
        vc.title = "First Title"
        return vc
    }()

    

    
    
    func start() {
        rootViewController = profileViewController
    }
    
    
    func goToDetails(album: AlbumResponse?) {
        guard let album = album else {
            return
        }

        let photosGridVC = AlbumDetailsPhotosGridViewController(viewModel: AlbumPhotosGridViewModel(album: album, photosService: AlbumPhotosWebServiceManager()))
        rootViewController.navigationController?.pushViewController(photosGridVC, animated: true)
    }
    
}
