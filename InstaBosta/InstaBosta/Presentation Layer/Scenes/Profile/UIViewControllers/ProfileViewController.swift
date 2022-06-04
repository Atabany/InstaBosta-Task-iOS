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
    let spinner = UIActivityIndicatorView(style: .large)

    
    let viewModel: ProfileViewModel
    let disposeBag = DisposeBag()

    var albumsDataSource: RxTableViewSectionedReloadDataSource<ProfileSection>?
    var showDetailsRequested: ((AlbumResponse)->())?
    
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    // MARK: - vc life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        style()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
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
        spinner.startAnimating()
    }
}

