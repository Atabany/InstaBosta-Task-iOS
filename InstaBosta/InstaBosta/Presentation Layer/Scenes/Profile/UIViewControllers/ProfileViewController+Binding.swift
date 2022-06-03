//
//  ProfileViewController+Binding.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 03/06/2022.
//

import Foundation

// MARK: - ProfileViewController+Binding

extension ProfileViewController {
    
    func bindUserInfo(user: UserViewModel) {
        headerView.nameLabel.text = user.name
        headerView.addressLabel.text = user.address
    }

    
    func binding() {
        
        viewModel.user.subscribe(onNext: {[weak self] user in
            guard let user = user else {
                return
            }
            

        }).disposed(by: disposeBag)

    }

    

    

    
    
    
    
}
