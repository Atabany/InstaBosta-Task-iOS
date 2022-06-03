//
//  ProfileViewController.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 01/06/2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - UI Components
    var headerView = AccountSummaryHeaderView(frame: .zero)
    var tableView = UITableView()
    let refreshControl = UIRefreshControl()
    
    
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
        setupRefreshControl()
    }
}


// MARK: - Style
extension ProfileViewController {
    private func style() {
        view.backgroundColor = .systemBackground
    }
}


