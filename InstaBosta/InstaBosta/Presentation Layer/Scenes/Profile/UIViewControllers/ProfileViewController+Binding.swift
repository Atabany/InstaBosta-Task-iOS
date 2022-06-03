//
//  ProfileViewController+Binding.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 03/06/2022.
//

import Foundation

// MARK: - ProfileViewController+Binding

extension ProfileViewController {
    
    func bindUserInfo(user: ProfileHeaderViewModel) {
        headerView.nameLabel.text = user.name
        headerView.addressLabel.text = user.address
    }

    
    func binding() {
        viewModel.user.subscribe(onNext: {[unowned self] user in
            guard let user = user  else {
                return
            }
            
            self.bindUserInfo(user: ProfileHeaderViewModel(user: user))
        }).disposed(by: disposeBag)
    }

    

    

    
    
    
    
}
