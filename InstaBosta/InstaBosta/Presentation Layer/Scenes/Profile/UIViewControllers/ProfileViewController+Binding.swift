//
//  ProfileViewController+Binding.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 03/06/2022.
//

import Foundation
import RxDataSources


// MARK: - ProfileViewController+Binding

extension ProfileViewController {
    
    func bindUserInfo(user: ProfileHeaderViewModel) {
        headerView.nameLabel.text = user.name
        headerView.addressLabel.text = user.address
    }

    
    func binding() {
        tableViewBinding()
        bindUserHeader()
    }


    private func bindUserHeader() {
        viewModel.user.subscribe(onNext: {[unowned self] user in
            guard let user = user  else {
                return
            }
            
            self.bindUserInfo(user: ProfileHeaderViewModel(user: user))
        }).disposed(by: disposeBag)

    }
    
    
    private func tableViewBinding() {
        createTableViewDataSource()
        if let albumsDataSource = albumsDataSource {
            viewModel.tableViewSections.bind(to: tableView.rx.items(dataSource: albumsDataSource))
                .disposed(by: disposeBag)
        }
    }
    
    
    
    // MARK: - Data Source
    private func createTableViewDataSource() {
        albumsDataSource = RxTableViewSectionedReloadDataSource<ProfileSection>(
            configureCell: { sectionsData, tableView, indexPath, album in
                let cell: AlbumTableCell = AlbumTableCell()
                cell.configure(with: AlbumItemViewModel(album: album))
                return cell
            })
    }




    
    
    
}
