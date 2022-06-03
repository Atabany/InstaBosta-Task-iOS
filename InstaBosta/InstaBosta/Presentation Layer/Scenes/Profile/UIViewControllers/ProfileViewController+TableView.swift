//
//  ProfileViewController+TableView.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 01/06/2022.
//

import UIKit

extension ProfileViewController {

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemBackground
        
        
        tableView.register(AlbumTableCell.self, forCellReuseIdentifier: AlbumTableCell.reuseID)
        tableView.rowHeight = AlbumTableCell.rowHeight
        tableView.tableFooterView = UIView()
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    
    func setupTableHeaderView() {
        var size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        headerView.frame.size = size
        tableView.tableHeaderView = headerView
    }
    
    
    func setupRefreshControl() {
        refreshControl.tintColor = .secondaryLabel
        refreshControl.addTarget(self, action: #selector(refreshContent), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
}



//MARK: - UITableView DataSource & Delegate
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableCell.reuseID, for: indexPath) as? AlbumTableCell else {return  UITableViewCell()}
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}


extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


extension ProfileViewController {
    
    
    @objc func refreshContent() {
        tableView.reloadData()
        //fetchData()
    }

}
