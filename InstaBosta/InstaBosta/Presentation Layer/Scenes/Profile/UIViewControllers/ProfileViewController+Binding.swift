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
        bindUserHeader()
        tableViewBinding()
        tableViewSelection()
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
    
    
    private func tableViewSelection() {
        tableView.rx.itemSelected.subscribe(onNext: { [unowned self] indexPath in
            self.tableView.deselectRow(at: indexPath, animated: true)
            guard let album = self.albumsDataSource?[indexPath] else { return }
            let photosGridVC = AlbumDetailsPhotosGridViewController(viewModel: AlbumPhotosGridViewModel(album: album))
            self.navigationController?.pushViewController(photosGridVC, animated: true)
        }).disposed(by: self.disposeBag)
    }
    
    
    // MARK: - Data Source
    private func createTableViewDataSource() {
        albumsDataSource = RxTableViewSectionedReloadDataSource<ProfileSection>(
            configureCell: { sectionsData, tableView, indexPath, album in
                let cell: AlbumTableCell = AlbumTableCell()
                cell.configure(with: AlbumItemViewModel(album: album))
                return cell
            },
            
            titleForHeaderInSection: { dataSoruce, sectionIndex in
                return dataSoruce[sectionIndex].header
            }
        )
    }




    
    
    
}
