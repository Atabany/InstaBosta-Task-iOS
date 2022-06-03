//
//  ProfileViewController.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 01/06/2022.
//

import UIKit
import RxSwift
import RxRelay
import RxDataSources


class ProfileViewController: UIViewController {
    
    // MARK: - UI Components
    var headerView = AccountSummaryHeaderView(frame: .zero)
    var tableView = UITableView()
    let refreshControl = UIRefreshControl()
    
    
    let viewModel: ProfileViewModel = ProfileViewModel(profileManager: ProfileWebServiceManager())
    let disposeBag = DisposeBag()

    var albumsDataSource: RxTableViewSectionedReloadDataSource<ProfileSection>?


    // MARK: - vc life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        style()
        
    }
}

// MARK: - SETUP

extension ProfileViewController {
    private func setup() {
        setupTableView()
        setupTableHeaderView()
        binding()
    }
    
}


// MARK: - Style
extension ProfileViewController {
    private func style() {
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}


